# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'booties/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'booties'
  s.version     = Booties::VERSION
  s.authors     = ['John Parker']
  s.email       = ['jparker@urgetopunt.com']
  s.homepage    = 'https://github.com/jparker/booties'
  s.summary     = 'Rails view helpers for Twitter Bootstrap.'
  s.description = 'Rails view helpers for Twitter Bootstrap.'
  s.license     = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*',
    'MIT-LICENSE',
    'Rakefile',
    'README.md'
  ]
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 2.3'

  s.add_dependency 'rails', '>= 5', '< 7'

  s.add_development_dependency 'minitest', '~> 5.7'
  s.add_development_dependency 'minitest-focus'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'rubocop'
end
