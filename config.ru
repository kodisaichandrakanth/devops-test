APP_ROOT = File.expand_path __dir__
require_relative "config/boot"
require "sidekiq/web"

use Rack::Static, root: "public", cascade: true, index: "index.html"

class App < Sinatra::Base
  get "/" do
    { jid: SampleJob.perform_async( rand(10) ) }.to_json
  end
end

run App
