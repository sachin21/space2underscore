# coding: utf-8

require 'bundler/setup'
require 'coveralls'
require 'space2underscore'

Coveralls.wear! if ENV['COVERALLS']
Bundler.setup

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
