module BDDSM
  class Expectation
    def initialize(actual_value:)
      @actual_value = actual_value
    end

    def to(matcher)
      suite.register_success if matcher.check(@actual_value)
    end

    def eq(expected)
      Matcher::Equal.new(expected: expected)
    end

    def not_eq(expected)
      Matcher::NotEqual.new(expected: expected)
    end

    def suite
      Suite.instance
    end
  end
end