# frozen_string_literal: true

module BDDSM
  module Matcher
    class NotEqual
      def initialize(expected:)
        @expected = expected
      end

      def check(actual)
        if actual != @expected
          return true
        else
          raise Matcher::Exception.new("Expected #{actual} to not eq #{@expected}")
        end
      end
    end
  end
end
