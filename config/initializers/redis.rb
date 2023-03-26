# frozen_string_literal: true

Rails.application.config.redis = ConnectionPool.new(size: Integer(ENV['REDIS_CONNECTION_POOL'].presence || 5),
                                                    timeout: Integer(ENV['REDIS_TIMEOUT'].presence || 5 )) do
  Redis.new(
    url: ENV['REDIS_URL_SIDEKIQ'] || 'redis://127.0.0.1',
    port: ENV['REDIS_PORT_RAILS'] || 6379,
    db: ENV['REDIS_DB_RAILS'] || 1
  )
end
