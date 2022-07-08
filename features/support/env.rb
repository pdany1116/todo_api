# frozen_string_literal: true

require 'cucumber/rails'
require 'factory_bot_rails'
require_relative 'web_helpers'
require_relative 'todo_helpers'

DatabaseCleaner.strategy = :transaction
DatabaseCleaner.allow_remote_database_url = true

World(Rails.application.routes.url_helpers)
World(Rack::Test::Methods)
World(WebHelpers)
World(TodoHelpers)
