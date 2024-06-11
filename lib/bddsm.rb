require 'singleton'

require_relative 'bddsm/actual'
require_relative 'bddsm/describe'
require_relative 'bddsm/equal_matcher'
require_relative 'bddsm/execution'
require_relative 'bddsm/failure'
require_relative 'bddsm/file'
require_relative 'bddsm/progress_report'
require_relative 'bddsm/result'
require_relative 'bddsm/suite'

module BDDSM
  def self.describe(title, &)
    # TODO: фиксировать файл, из которого подгружен describe,
    # чтобы потом корректно отображать строку ошибки и собирать статистику
    Suite.instance.add_describe Describe.new(title, &)
  end
end
