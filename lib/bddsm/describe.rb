# frozen_string_literal: true

module BDDSM
  class Describe
    attr_reader :title

    def initialize(title, &block)
      @title = title
      @block = block
    end

    def run
      instance_eval(&@block)
    end

    def it(&)
      It.new(describe: self, &).run
    end

    def suite
      @suite ||= Suite.instance
    end
  end
end
