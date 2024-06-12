# frozen_string_literal: true

module BDDSM
  class Suite
    include Singleton

    def initialize
      @files = []
      @describes = []

      result_collector.subscribe report
    end

    def run
      load_files
      run_describes
      print_report
    end

    def report
      @report ||= BDDSM::Report.new(result_collector: result_collector, io: $stdout)
    end

    def add_path(path)
      @files << BDDSM::File.new(path)
    end

    def add_describe(describe)
      @describes << describe
    end

    def result_collector
      @result_collector ||= BDDSM::ResultCollector.new
    end

  private

    def load_files
      @files.each(&:load)
    end

    def run_describes
      @describes.each(&:run)
    end

    def print_report
      report.print
    end

  end
end
