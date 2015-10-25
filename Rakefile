require "bundler/gem_tasks"
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

namespace :spec do
  desc "Run RSpec with SimpleCov"
  task :with_simplecov do
    ENV['COVERAGE'] = 'true'
    Rake::Task['spec'].execute
  end
end
