# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'space2underscore/version'

Gem::Specification.new do |spec|
  spec.name          = 'space2underscore'
  spec.version       = Space2underscore::VERSION
  spec.authors       = ['sachin21']
  spec.email         = ['sachin21dev@gmail.com']
  spec.description   = 'Change the space into underscore'
  spec.summary       = 'Change the space into underscore'
  spec.homepage      = 'https://github.com/sachin21/space2underscore'
  spec.license       = 'MIT'

  spec.metadata = {
    'bug_tracker_uri' => 'https://github.com/sachin21/space2underscore/issues',
    'source_code_uri' => 'https://github.com/sachin21/space2underscore'
  }

  spec.files         = Dir.glob('{bin,lib}/**/*') + %w[README.md MIT-LICENSE CHANGELOG.md post_install_message.txt]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.4.0'

  spec.post_install_message = File.read('post_install_message.txt')

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop', '~> 1.0'
end
