require 'singleton'

module BDDSM
  class Actual
    attr_reader :value

    def initialize(value:)
      @value = value
    end

    def to(matcher)
      matcher.match(self)
    end
  end

  class EqualMatcher
    def initialize(expected:, location:)
      @expected = expected
      @location = location
    end

    def match(actual)
      if actual.value == @expected
        suite.register_success
      else
        suite.register_failure("Expected #{actual.value} to eq #{@expected}", location: @location)
      end
    end

    def suite = Suite.instance
  end

  class Execution
    def initialize(describe:, &block)
      @describe = describe
      @block = block
    end

    def run
      instance_eval(&@block)
    end

    def expect(actual)
      Actual.new(value: actual)
    end

    def eq(expected)
      EqualMatcher.new(expected:, location:)
    end

    def location = @block.source_location
  end

  class Describe
    def initialize(title, &block)
      @title = title
      @block = block
    end

    def run
      instance_eval(&@block)
    end

    def it(&)
      Execution.new(describe: self, &).run
    end
  end

  def self.describe(title, &)
    # TODO: фиксировать файл, из которого подгружен describe,
    # чтобы потом корректно отображать строку ошибки и собирать статистику
    Suite.instance.add_describe Describe.new(title, &)
  end

  class File
    def initialize(path)
      @path = path
    end

    def run
      require @path
    end
  end

  class ProgressReport
    def initialize(result:, io:)
      @result = result
      @io = io
    end

    def success
      @io.print '.'
    end

    def failure
      @io.print 'E'
    end

    def finalize
      @io.puts
      @io.puts
      @io.puts 'OK!'
      @io.puts "Success: #{@result.successes}"
      @io.puts "Failures: #{@result.failures_count}"
      @io.puts
      @io.puts
      @result.failures.each do |failure|
        @io.puts failure.error
        @io.puts "  at #{failure.location}"
      end
    end
  end

  class Failure
    attr_reader :error

    def initialize(error, location:)
      @error = error
      @location = location
    end

    def location = @location.join('#')
  end

  class Result
    attr_reader :successes, :failures

    def initialize
      @successes = 0
      @failures = []
      @listeners = []
    end

    def failures_count = @failures.size

    def register_success
      @successes += 1

      @listeners.each(&:success)
    end

    def register_failure(error, location:)
      @failures << Failure.new(error, location:)

      @listeners.each(&:failure)
    end

    def subscribe(listener)
      @listeners << listener
    end
  end

  class Suite
    include Singleton

    def initialize
      @files = []
      @describes = []

      result.subscribe report
    end

    def report = @report ||= ProgressReport.new(result:, io: $stdout)

    def add_path(path)
      @files << File.new(path)
    end

    def add_describe(describe)
      @describes << describe
    end

    def load_files = @files.each(&:run)
    def run_examples = @describes.each(&:run)

    def run
      load_files
      run_examples
      finalize_report
    end

    def finalize_report = report.finalize

    def register_success = result.register_success

    def register_failure(error, location:)
      result.register_failure(error, location:)
    end

    def result = @result ||= Result.new
  end
end
