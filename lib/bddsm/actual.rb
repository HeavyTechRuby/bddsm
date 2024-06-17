# frozen_string_literal: true

module BDDSM
  class Actual
    MATCH_METHODS = %w[eq not_eq].freeze

    def initialize(value:)
      @value = value
    end

    def to(matcher)
      suite.result.register_success if matcher.check(actual_value: @value)
    end

    def eq(expected_value)
      Matcher::Equal.new(expected_value:)
    end

    def not_eq(expected_value)
      Matcher::NotEqual.new(expected_value:)
    end

    def suite
      Suite.instance
    end
  end
end
