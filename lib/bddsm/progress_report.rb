module BDDSM
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
end
