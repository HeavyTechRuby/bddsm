require_relative 'lib/bddsm/version'

task default: :build

task :build do
  system 'gem build bddsm.gemspec'
end

task install: :build do
  system "gem install bddsm-#{BDDSM::GEM_VERSION}.gem"
end

task publish: :build do
  system "gem push bddsm-#{BDDSM::GEM_VERSION}.gem"
end

task :clean do
  system 'rm *.gem'
end
