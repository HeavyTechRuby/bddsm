module BDDSM
  class Describe
    attr_reader :memoized_lets, :it_comments

    def initialize(title, &block)
      @title = title
      @block = block
      @memoized_lets = {}
      @it_comments = {}
    end

    def run
      instance_eval(&@block)
    end

    def it(comment = nil, &)
      execution = Execution.new(describe: self, &)
      @it_comments[execution] = comment
      execution.run
    end

    def let(name, &)
      singleton_class.instance_eval { attr_accessor name.to_sym } unless respond_to?(name.to_sym)
      @memoized_lets[name] = instance_exec(&)
      instance_variable_set("@#{name}", @memoized_lets[name])
    end

    def context(title, &)
      Suite.instance.add_describe Describe.new(title, &)
    end
  end
end
