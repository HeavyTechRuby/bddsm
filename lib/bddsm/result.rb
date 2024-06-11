# frozen_string_literal: true

module BDDSM
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
end
