# coding: utf-8

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :spec do
  desc 'Run RSpec with Coveralls'
  task :with_coveralls do
    ENV['COVERALLS'] = 'true'
    Rake::Task['spec'].execute
  end
end
