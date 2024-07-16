module BDDSM
  class EqualMatcher
    def initialize(expected:, location:, comment:)
      @expected = expected
      @location = location
      @comment = comment
    end

    def match(actual)
      if actual.value == @expected
        suite.register_success
      else
        description = @comment.nil? ? '' : " in #{@comment}"

        suite.register_failure("Expected #{actual.value} to eq #{@expected}#{description}", location: @location)
      end
    end

    def suite = Suite.instance
  end
end
