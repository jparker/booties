$:.push File.expand_path('../lib', __FILE__)

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

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']
  s.test_files = Dir['test/**/*']

  s.required_ruby_version = '>= 2.1'

  #s.add_dependency "rails", "~> 5.0.0", ">= 5.0.0.1"
  s.add_dependency 'rails', '>= 4.1', '< 5.1'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'minitest', '~> 5.7'
  s.add_development_dependency 'minitest-focus'
  s.add_development_dependency 'minitest-reporters'
  s.add_development_dependency 'pry-rails'
end
