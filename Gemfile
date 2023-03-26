# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'

gem 'rails', '~> 6.1.6.1'

gem 'active_storage_validations'
gem 'activeadmin'
gem 'bootsnap', '>= 1.4.2', require: false
gem 'connection_pool'
gem 'devise'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.3'
gem 'hiredis'
gem 'redis', '~> 4.0'
gem 'sass-rails'
gem 'sidekiq'
gem 'sidekiq-scheduler'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv'
  gem 'pry-byebug'
  gem 'pry-rails', '~> 0.3.4'
  gem 'rswag-specs'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'smarter_csv'
end

group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'letter_opener'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'terminal-notifier'
  gem 'terminal-notifier-guard'
end

group :test do
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'mock_redis'
  gem 'pdf-reader'
  gem 'rspec-its'
  gem 'rspec_junit_formatter'
  gem 'rspec-rails'
  gem 'rspec-sonarqube-formatter', '~> 1.5', require: false
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'vcr'
  gem 'webmock'
end
