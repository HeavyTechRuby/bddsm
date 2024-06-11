# frozen_string_literal: true

module BDDSM
  class It
    class Exception < ::Exception
      attr_reader :line_code
      def initialize(msg, line_code:)
        @line_code = line_code
        super msg
      end
    end

    class CodeException < ::Exception
      attr_reader :line_code
      def initialize(msg, line_code:)
        @line_code = line_code
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
      raise It::Exception.new(e, line_code: @line_code)
    rescue => e
      raise It::CodeException.new(e, line_code: e.backtrace.first)
    end

    def expect(actual)
      @line_code = caller.first
      @expectation = Expectation.new(actual_value: actual)
    end

    def eq(expected)
      @expectation.eq expected
    end

    def not_eq(expected)
      @expectation.not_eq expected
    end
  end
end