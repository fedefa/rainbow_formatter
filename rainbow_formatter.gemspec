# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'formatter/version'

Gem::Specification.new do |s|
  s.name        = 'rainbow_formatter'
  s.version     = Formatter::VERSION
  s.authors     = ['Federico Farina']
  s.email       = ['federicojosefarina@gmail.com']
  s.platform = Gem::Platform::RUBY
  s.homepage    = 'https://github.com/fedefa/rainbow-formatter'
  s.summary     = 'Customizable RSpec formatter'
  s.description = 'Customizable ascii-music RSpec formattter'
  s.license = 'MIT'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_dependency 'rspec', '>= 3', '< 4'

  s.add_development_dependency 'pry'
  s.add_development_dependency 'rake'
end
