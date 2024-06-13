# frozen_string_literal: true

module BDDSM
  class It
    class Exception < ::Exception
      attr_reader :line_code, :context_title
      def initialize(msg, line_code:, context_title:)
        @line_code = line_code
        @context_title = context_title
        super msg
      end
    end

    def initialize(describe:, &block)
      @describe = describe
      @block = block
    end

    def run
      instance_eval(&@block)
    rescue Matcher::Exception => e
      suite.result.register_failure(It::Exception.new(e, line_code: @line_code, context_title: @describe.title))
    rescue => e
      suite.result.register_failure(It::Exception.new(e, line_code: e.backtrace.first, context_title: @describe.title))
    end

    def expect(actial_value)
      @line_code = caller.first
      @actual = Actual.new(value: actial_value)
    end

    def suite
      @suite ||= Suite.instance
    end

    def method_missing(name, *args)
      @actual.public_send name, *args
    end
  end
end
