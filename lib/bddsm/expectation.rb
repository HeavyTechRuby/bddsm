module BDDSM
  class Expectation
    def initialize(value:)
      @value = value
    end

    # Плохо, что Actual знает про suite и накопитель результатов
    def to(matcher)
      suite.result_collector.register_success if matcher.check(@value)
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