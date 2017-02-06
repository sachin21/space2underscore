# frozen_string_literal: true

require 'bundler/setup'
require 'space2underscore'

if ENV['COVERALLS']
  require 'coveralls'
  Coveralls.wear!
end

Bundler.setup

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
