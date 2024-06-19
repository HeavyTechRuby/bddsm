module BDDSM
  class Actual
    attr_reader :value

    def initialize(value:)
      @value = value
    end

    def to(matcher)
      matcher.match(self)
    end
  end
end
