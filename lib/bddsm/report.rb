# frozen_string_literal: true

module BDDSM
  class Report
    def initialize(result_collector:, io:)
      @result_collector = result_collector
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
      @io.puts "Success: #{@result_collector.successes}"
      @io.puts "Failures: #{@result_collector.failures.count}"
      @io.puts
      @io.puts 'Failures:'
      @result_collector.failures.each do |failure|
        @io.puts failure
        @io.puts "  at #{failure.line_code}"
      end
    end
  end
end
