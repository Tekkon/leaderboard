# frozen_string_literal: true

require 'sidekiq'
require 'sidekiq/api'
require 'sidekiq/web'

redis_config = Rails.application.config_for(:redis) || {}

redis = {
  url: ENV.fetch('REDIS_URL_SIDEKIQ',
                 "redis#{redis_config['ssl'] ? 's' : ''}://#{redis_config['host']}:#{redis_config['port']}/#{redis_config['db']}")
}

redis_pass = redis_config['password']
redis[:password] = redis_pass if redis_pass.present?

Sidekiq.strict_args!

Sidekiq.configure_server do |config|
  config.redis = redis
  config.average_scheduled_poll_interval = 15
end

Sidekiq.configure_client do |config|
  config.redis = redis
end

Sidekiq.default_worker_options = { queue: 'default', backtrace: true, retry: 3 }
ActiveJob::Base.logger = Rails.logger
