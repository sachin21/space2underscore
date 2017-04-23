# frozen_string_literal: true

require 'pry'
require_relative '../lib/space2underscore'

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
