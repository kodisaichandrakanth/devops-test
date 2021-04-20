# frozen_string_literal: true

# Set number of Puma processes (worker). In development we
# only one 1 for byebug to work nicely.
workers Integer(ENV["WEB_CONCURRENCY"] || 2)

# Min and Max threads per Pumar worker
threads_count = Integer(ENV["PUMA_MAX_THREADS"] || 5)
threads threads_count, threads_count

rackup DefaultRackup
port ENV["PORT"] || 5000
environment ENV["RACK_ENV"] || "development"

preload_app!
