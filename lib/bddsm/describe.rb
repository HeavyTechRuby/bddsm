# frozen_string_literal: true

module BDDSM
  class Describe
    def initialize(title, &block)
      @title = title
      @block = block
    end

    def run
      instance_eval(&@block)
    end

    def it(&block)
      It.new(describe: self, &block).run
    rescue It::Exception => e
      suite.execution_statistics.register_failure(e)
    rescue It::CodeException => e
      suite.execution_statistics.register_error(e)
    end

    def suite
      Suite.instance
    end
  end
end
