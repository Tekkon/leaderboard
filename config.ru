# frozen_string_literal: true

# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# class StatusAuth < Rack::Auth::Basic
#   def call(env)
#     request = Rack::Request.new(env)
#     if ['/api/v1/status'].include? request.path
#       super
#     else
#       @app.call(env)
#     end
#   end
# end

# use StatusAuth, 'Restricted Area' do |username, password|
#   [username, password] == %w[admin 8b7246307abe5131bfe9a8ffa9eb9f413d45e3d4ec88ce7b8d1fc0c47c4a593703ef9375c346bbd1a914ad9ae4f0c8a890545c507f3f50a9c798adb6a6d894fe]
# end

run Rails.application
