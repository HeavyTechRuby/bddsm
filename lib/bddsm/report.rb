# frozen_string_literal: true

module BDDSM
  class Report
    def initialize(result:, io:)
      @result = result
      @io = io
    end

    def success
      @io.print '.'
    end

    def failure
      @io.print 'F'
    end

    def print
      @io.puts
      @io.puts
      @io.puts "Success: #{@result.successes}"
      @io.puts "Failures: #{@result.failures.count}"
      @io.puts
      @io.puts 'Failures:'
      @result.failures.each do |failure|
        @io.puts "#{failure.context_title} failed:"
        @io.puts "  #{failure}"
        @io.puts "    at #{failure.line_code}"
      end
    end
  end
end
