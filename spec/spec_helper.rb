# coding: utf-8

require 'bundler/setup'
require 'coveralls'
require 'space2underscore'
require 'simplecov'

Coveralls.wear! if ENV['COVERALLS']

if ENV['SIMPLECOV']
  SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter,
    Coveralls::SimpleCov::Formatter
  ]

  SimpleCov.start do
    add_filter '/vendor/'
  end
end

Bundler.setup

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
