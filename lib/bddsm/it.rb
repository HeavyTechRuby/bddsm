# frozen_string_literal: true

module BDDSM
  class It
    class Exception < ::Exception
      attr_reader :line_code
      attr_accessor :context_title
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
      raise It::Exception.new(e, line_code: e.backtrace.first)
    end

    def expect(actual)
      @line_code = caller.first
      @actual = Actual.new(value: actual)
    end

    def eq(expected)
      @actual.eq expected
    end

    def not_eq(expected)
      @actual.not_eq expected
    end
  end
end
