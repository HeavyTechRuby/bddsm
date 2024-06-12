# frozen_string_literal: true

module BDDSM
  class ExecutionStatistics
    attr_reader :successes, :failures

    def initialize
      @successes = 0
      @failures = []
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

    def subscribe(listener)
      @listeners << listener
    end
  end
end
