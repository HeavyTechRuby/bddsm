# frozen_string_literal: true

module BDDSM
  class Expectation
    def initialize(actial_value:)
      @actial_value = actial_value
    end

    # Проверка ожидания на корректность, другими словами реализация ожидания
    def to(matcher)
      # Плохо, что Expectation знает про suite и накопитель результатов
      suite.result_collector.register_success if matcher.check(actual_value: @actial_value)
    end

    def eq(expected_value)
      Matcher::Equal.new(expected_value: expected_value)
    end

    def not_eq(expected_value)
      Matcher::NotEqual.new(expected_value: expected_value)
    end

    def suite
      Suite.instance
    end
  end
end