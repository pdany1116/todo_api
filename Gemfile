# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.2'

gem 'active_model_serializers', '~> 0.10.13'
gem 'bootsnap', '~> 1.12.0', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors', '~> 1.1.1'
gem 'rails', '~> 7.0.3'
gem 'tzinfo-data', '~> 2.0.4', platforms: %i[mingw mswin x64_mingw jruby]

group :test do
  gem 'cucumber-rails', '~> 2.5.1', require: false
  gem 'database_cleaner', '~> 2.0.1'
  gem 'rack-test', '~> 2.0.2'
end

group :development, :test do
  gem 'debug', '~> 1.5.0', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '~> 2.7.6'
  gem 'factory_bot_rails', '~> 6.2.0'
  gem 'faker', '~> 2.21.0'
  gem 'rspec-rails', '~> 5.1.2'
  gem 'rubocop', '~> 1.31.1'
  gem 'rubocop-rails', '~> 2.15.1'
  gem 'rubocop-rspec', '~> 2.12.1'
end
