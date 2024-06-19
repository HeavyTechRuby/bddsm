module BDDSM
  class Describe
    def initialize(title, &block)
      @title = title
      @block = block
    end

    def run
      instance_eval(&@block)
    end

    def it(&)
      Execution.new(describe: self, &).run
    end
  end
end
