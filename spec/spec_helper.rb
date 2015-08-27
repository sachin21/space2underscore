require 'bundler/setup'
require 'space2underscore'
Bundler.setup

RSpec.configure do |config|
  config.order = 'random'
  config.expect_with :rspec do |rspec|
    rspec.syntax = :expect
  end
end
