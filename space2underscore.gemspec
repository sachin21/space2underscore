# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'space2underscore/version'

Gem::Specification.new do |spec|
  spec.name          = 'space2underscore'
  spec.version       = Space2underscore::VERSION
  spec.authors       = ['sachin21']
  spec.email         = ['sachin21.developer@gmail.com']
  spec.description   = 'change the space into underscore'
  spec.summary       = 'change the space into underscore'
  spec.homepage      = 'http://github.com/sachin21/space2underscore'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
end
