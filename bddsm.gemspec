require_relative 'lib/bddsm/version'

Gem::Specification.new do |s|
  s.name        = 'bddsm'
  s.version     = BDDSM::VERSION

  s.summary     = 'Hard Testing Framework. Multi-paradigm spec/feature/xunit-agnostic syntax support.'
  s.authors     = ['Sergei O. Udalov']
  s.files       = Dir['lib/**/*']
  s.homepage    = 'https://github.com/HeavyTechRuby/bddsm'
  s.bindir      = 'bin'
  s.metadata['rubygems_mfa_required'] = 'true'

  s.required_ruby_version = '>= 3.2'
  s.executables = 'bddsm'
end
