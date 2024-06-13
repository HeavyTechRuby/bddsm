require 'singleton'

require_relative 'bddsm/actual'
require_relative 'bddsm/describe'
require_relative 'bddsm/matcher/exception'
require_relative 'bddsm/matcher/equal'
require_relative 'bddsm/matcher/not_equal'
require_relative 'bddsm/it'
require_relative 'bddsm/file'
require_relative 'bddsm/report'
require_relative 'bddsm/result'
require_relative 'bddsm/suite'

module BDDSM
  def self.describe(title, &)
    # TODO: фиксировать файл, из которого подгружен describe,
    # чтобы потом корректно отображать строку ошибки и собирать статистику
    Suite.instance.add_describe Describe.new(title, &)
  end
end
