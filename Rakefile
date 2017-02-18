# frozen_string_literal: true

require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec)

gem_helper = Bundler::GemHelper.new

desc "Create tag #{gem_helper.send(:version_tag)}"
task :tag do
  gem_helper.send(:tag_version) unless gem_helper.send(:already_tagged?)
end

task default: :spec

namespace :spec do
  desc 'Run RSpec with Coveralls'
  task :with_coveralls do
    ENV['COVERALLS'] = 'true'
    Rake::Task['spec'].execute
  end
end
