# frozen_string_literal: true

module BDDSM
  module Matcher
    class NotEqual
      def initialize(expected_value:)
        @expected_value = expected_value
      end

      def check(actual_value:)
        if actual_value != @expected_value
          return true
        else
          raise Matcher::Exception.new("Expected #{actual_value} to not eq #{@expected_value}")
        end
      end
    end
  end
end
