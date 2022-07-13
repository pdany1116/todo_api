# frozen_string_literal: true

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

if ENV['RAILS_ENV'].in? %w[test development]
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new :rubocop

  desc 'Run rubocop, rspec, cucumber'
  task default: %i[rubocop spec cucumber]
end
