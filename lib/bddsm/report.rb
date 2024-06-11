# frozen_string_literal: true

module BDDSM
  class Report
    def initialize(execution_statistics:, io:)
      @execution_statistics = execution_statistics
      @io = io
    end

    def success
      @io.print '.'
    end

    def failure
      @io.print 'F'
    end

    def error
      @io.print 'E'
    end

    def print
      @io.puts
      @io.puts
      @io.puts 'OK!'
      @io.puts "Success: #{@execution_statistics.successes}"
      @io.puts "Failures: #{@execution_statistics.failures.count}"
      @io.puts "Errors: #{@execution_statistics.errors.count}"
      @io.puts
      @io.puts 'Failures:'
      @execution_statistics.failures.each do |failure|
        @io.puts failure
        @io.puts "  at #{failure.line_code}"
      end
      @io.puts
      @io.puts 'Errors:'
      @execution_statistics.errors.each do |failure|
        @io.puts failure
        @io.puts "  at #{failure.line_code}"
      end
    end
  end
end
