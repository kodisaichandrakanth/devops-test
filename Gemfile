# frozen_string_literal: true

source "https://rubygems.org"

# If we update this, update .heal/.ruby-version file.
ruby "2.6.6"

gem "aws-sdk-sqs"
gem "aws-sdk-core"
gem "aws-sdk-iam"
gem "dotenv"
gem "foreman"
gem "grape"
gem "moneta"
gem "puma"
gem "rack-cors"
gem "rack-contrib", require: "rack/contrib"
gem "rack-ssl-enforcer"
gem "rake"
gem "sinatra", require: "sinatra/base"
gem "sidekiq"
gem "twilio-ruby"
gem "mongoid"
gem "activesupport"

group :development do
  gem "shotgun", platforms: :ruby
end

group :test, :development do
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "minitest-reporters"
  gem "rack-test"
end

group :production do
end
