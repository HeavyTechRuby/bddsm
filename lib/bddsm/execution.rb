module BDDSM
  class Execution
    def initialize(describe:, &block)
      @describe = describe
      @memoized_lets ||= {}
      @block = block
      memoized
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

    private

    def memoized
      return unless @describe.memoized_lets

      @describe.memoized_lets.each do |k, v|
        self.class.define_method(k) do
          @memoized_lets[k] ||= v
        end
      end
    end
  end
end
