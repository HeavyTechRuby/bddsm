# frozen_string_literal: true

module BDDSM
  module Matcher
    class Equal
      def initialize(expected:)
        @expected = expected
      end

      def check(actual)
        if actual == @expected
          return true
        else
          raise Matcher::Exception.new("Expected #{actual} to eq #{@expected}")
        end
      end
    end
  end
end
