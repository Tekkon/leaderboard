# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'support/factory_bot'
require 'database_cleaner'
require 'rspec-sidekiq'
require 'rspec/its'
require 'shoulda/matchers'
require 'faker'

# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }
# Checks for pending migration and applies them before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://relishapp.com/rspec/rspec-rails/docs
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")

  config.before do
    DatabaseCleaner[:active_record].strategy = :transaction
    DatabaseCleaner.start
  end

  config.after do
    DatabaseCleaner.clean
  end

  config.before(:suite) do
    DatabaseCleaner[:active_record].strategy = :truncation
    DatabaseCleaner.start
  ensure
    DatabaseCleaner.clean
  end

  config.before do
    Sidekiq::Worker.clear_all
  end

  RSpec::Sidekiq.configure do |configuration|
    configuration.warn_when_jobs_not_processed_by_sidekiq = false
    configuration.clear_all_enqueued_jobs = true # default => true

    # Whether to use terminal colours when outputting messages
    configuration.enable_terminal_colours = true # default => true

    # Warn when jobs are not enqueued to Redis but to a job array
    configuration.warn_when_jobs_not_processed_by_sidekiq = true # default => true
  end

  Shoulda::Matchers.configure do |configuration|
    configuration.integrate do |with|
      with.test_framework :rspec
      with.library :rails
    end
  end

  RSpec::Matchers.define :permit do |action|
    match do |policy|
      policy.public_send("#{action}?")
    end

    failure_message do |policy|
      "#{policy.class} does not permit #{action} on #{policy.record} for #{policy.user.inspect}."
    end

    failure_message_when_negated do |policy|
      "#{policy.class} does not forbid #{action} on #{policy.record} for #{policy.user.inspect}."
    end
  end
end
