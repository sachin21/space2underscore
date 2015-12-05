# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'space2underscore/version'

Gem::Specification.new do |spec|
  spec.name          = 'space2underscore'
  spec.version       = Space2underscore::VERSION
  spec.authors       = ['sachin21']
  spec.email         = ['sachin21.developer@gmail.com']
  spec.description   = 'Change the space into underscore'
  spec.summary       = 'Change the space into underscore'
  spec.homepage      = 'https://github.com/sachin21/space2underscore'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($RS)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.post_install_message = <<-EOF.gsub('    ', '')
    ..........................................................
    __________________________________________________________

    Thank you for installing space2underscore.

    ************************* Usage **************************

    From the command line:

    $ s2u new branch -c
    =>  Switched to a new branch 'new_branch’

    Or

    $ git branch -m $(space2underscore renamed branch)

    ----------------------------------------------------------
    ..........................................................
  EOF

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rubocop'
end
