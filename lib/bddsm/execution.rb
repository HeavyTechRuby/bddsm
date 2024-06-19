module BDDSM
  class Execution
    def initialize(describe:, &block)
      @describe = describe
      @block = block
    end

    def run
      instance_eval(&@block)
    end

    def expect(actual)
      Actual.new(value: actual)
    end

    def eq(expected)
      EqualMatcher.new(expected:, location:)
    end

    def location = @block.source_location
  end
end
