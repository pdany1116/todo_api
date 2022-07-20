# frozen_string_literal: true

require_relative 'config/application'

Rails.application.load_tasks

if ENV['RAILS_ENV'].in? %w[test development]
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new :rubocop

  desc 'Run rubocop, rspec, cucumber'
  task default: %i[rubocop spec cucumber]
end
