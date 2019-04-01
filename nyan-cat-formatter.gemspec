# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |s|
  s.name        = 'rainbow-formatter'
  s.version     = '0.1.0'
  s.authors     = ['Federico Farina']
  s.email       = ['matt@mattsears.com']
  s.homepage    = 'PENDING'
  s.summary     = 'Matt Sears Nyan Cat formatter inspired RSpec formatter!'
  s.description = s.summary

  s.rubyforge_project = 'rainbow-formatter'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rspec', '>= 2.14.2', '>= 2.99', '< 4'

  s.add_development_dependency 'rake'
end
