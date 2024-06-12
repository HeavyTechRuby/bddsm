module BDDSM
  class Describe
    attr_reader :memoized_lets

    def initialize(title, &block)
      @title = title
      @block = block
      @memoized_lets = {}
    end

    def run
      instance_eval(&@block)
    end

    def it(&)
      Execution.new(describe: self, &).run
    end

    def let(name, &)
      self.singleton_class.instance_eval { attr_accessor name.to_sym }
      @memoized_lets[name] ||= instance_exec(&)
      self.instance_variable_set("@#{name}", instance_exec(&))
    end
  end
end
