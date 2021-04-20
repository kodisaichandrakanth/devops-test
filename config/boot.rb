# frozen_string_literal: true
RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined?(RACK_ENV)
# For Sidekiq
ENV["APP_ENV"] ||= RACK_ENV

lib = File.expand_path("../lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

# Loads bundler and all dependencies in Gemfile.
require "bundler/setup"
Bundler.require(:default, RACK_ENV)
# Load local file if available `.env.local`, `.env`, etc
Dotenv.load(".env.local", ".env.#{RACK_ENV}", ".env")

# Load both Sidekiq client/server
@redis_url = ENV["REDIS_URL"]
Sidekiq.configure_client do |config|
  # Do this last as redis logger is eager loading
  config.redis = { url: @redis_url, db: 1, network_timeout: 5 }
end

Sidekiq.configure_server do |config|
  # Do this last as redis logger is eager loading
  config.redis = { url: @redis_url, db: 1, network_timeout: 5 }
end

class SampleJob
  include Sidekiq::Worker

  def perform(s = 1)
    puts "Performing job.. #{s}"
    puts "done #{s}."
  end
end
