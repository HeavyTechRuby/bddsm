module BDDSM
  class EqualMatcher
    def initialize(expected:, location:)
      @expected = expected
      @location = location
    end

    def match(actual)
      if actual.value == @expected
        suite.register_success
      else
        suite.register_failure("Expected #{actual.value} to eq #{@expected}", location: @location)
      end
    end

    def suite = Suite.instance
  end
end
