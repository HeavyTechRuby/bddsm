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

    # Сейчас It ничего не знает о Describe
    def initialize(&block)
      @block = block
    end

    # Когда спотыкается на ошибке, он передает ее для обработки Describe, который в свою очередь уже обогащает ошибку
    # своим наименованием, и регистрирует в накопителе результатов
    def run
      instance_eval(&@block)
    rescue Matcher::Exception => e
      raise It::Exception.new(e, line_code: @line_code)
    rescue => e
      raise It::Exception.new(e, line_code: e.backtrace.first)
    end

    def expect(actual)
      @line_code = caller.first
      @expectation = Expectation.new(value: actual)
    end

    def method_missing(name, *args)
      @expectation.public_send name, *args
    end
  end
end
