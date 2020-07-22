# frozen_string_literal: true

require_relative 'lib/parameterised/paths/version'

Gem::Specification.new do |spec|
  spec.name = 'parameterised-paths'
  spec.version = Parameterised::Paths::VERSION
  spec.authors = [
    'Christopher Birmingham'
  ]
  spec.email = [
    'chris.birmingham@hotmail.co.uk'
  ]

  spec.summary = 'A little gem for matching potentially parameterised paths'
  spec.description = 'A little gem for matching potentially parameterised paths'
  spec.homepage = 'https://github.com/chrisBirmingham/parameterised-paths'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.files = Dir['lib/**/*'] + ['LICENSE']
  spec.license = 'Unlicense'

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 12.3'
end
