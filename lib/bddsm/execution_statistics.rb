# frozen_string_literal: true

module BDDSM
  class ExecutionStatistics
    attr_reader :successes, :failures, :errors

    def initialize
      @successes = 0
      @failures = []
      @errors = []
      @listeners = []
    end

    def register_success
      @successes += 1
      @listeners.each(&:success)
    end

    def register_failure(failure)
      @failures << failure
      @listeners.each(&:failure)
    end

    def register_error(error)
      @errors << error
      @listeners.each(&:error)
    end

    def subscribe(listener)
      @listeners << listener
    end
  end
end
