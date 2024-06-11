# frozen_string_literal: true

module BDDSM
  class Suite
    include Singleton

    def initialize
      @files = []
      @describes = []

      execution_statistics.subscribe report
    end

    def run
      load_files
      run_describes
      print_report
    end

    def report
      @report ||= BDDSM::Report.new(execution_statistics: execution_statistics, io: $stdout)
    end

    def add_path(path)
      @files << BDDSM::File.new(path)
    end

    def add_describe(describe)
      @describes << describe
    end

    def register_success
      execution_statistics.register_success
    end

    def register_failure(error)
      execution_statistics.register_failure(error)
    end

    def execution_statistics
      @result ||= BDDSM::ExecutionStatistics.new
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
