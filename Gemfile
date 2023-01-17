# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'active_model_serializers'
gem 'bootsnap', require: false
gem 'graphql', '~> 2.0'
gem 'iri', '~> 0.5.1'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 7.0.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :test do
  gem 'cucumber-rails', require: false
  gem 'database_cleaner'
  gem 'rack-test'
end

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-graphql'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
end

group :development do
  gem 'graphiql-rails', '~> 1.8'
  gem 'sass-rails', '~> 6.0'
end
