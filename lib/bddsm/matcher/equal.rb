# frozen_string_literal: true

module BDDSM
  module Matcher
    class Equal
      def initialize(expected_value:)
        @expected_value = expected_value
      end

      def check(actual_value:)
        return true if actual_value == @expected_value

        raise Matcher::Exception.new("Expected #{actual_value} to eq #{@expected_value}")
      end
    end
  end
end
