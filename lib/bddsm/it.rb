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

    # Неожиданно, что конструкция expect(1) - возвращает Actual
    # Напрашивается, что она должна возвратить Expectation
    # и у этого ожидания есть метод to (который фактически и проверяет это самое ожидание)
    def expect(actual)
      @line_code = caller.first
      @actual = Actual.new(value: actual)
    end

    # Этот метод как будто не должен быть в It
    def eq(expected)
      @actual.eq expected
    end

    # Этот метод как будто не должен быть в It
    def not_eq(expected)
      @actual.not_eq expected
    end
  end
end
