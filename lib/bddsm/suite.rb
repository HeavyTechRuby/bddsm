# frozen_string_literal: true

module BDDSM
  class Suite
    include Singleton

    def initialize
      @files = []
      @describes = []

      result.subscribe report
    end

    def report = @report ||= BDDSM::ProgressReport.new(result:, io: $stdout)

    def add_path(path)
      @files << BDDSM::File.new(path)
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

    def result = @result ||= BDDSM::Result.new
  end
end