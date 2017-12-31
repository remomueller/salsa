# frozen_string_literal: true

source "https://rubygems.org"

gem "rails",                "5.2.0.beta2"

# Speed up loading times.
gem "bootsnap",             "1.1.7", require: false

# Database Adapter
gem "pg",                   "0.21.0"

# Gems used by project
gem "bootstrap-sass",       "~> 3.3.7"
gem "carrierwave",          "~> 1.2.1"
gem "devise",               "~> 4.4.0"
gem "figaro",               "~> 1.1.1"
gem "font-awesome-rails",   "~> 4.7.0"
gem "haml",                 "~> 5.0.4"
gem "kaminari",             "~> 1.1.1"

# Rails Defaults
gem "coffee-rails",         "~> 4.2"
gem "sass-rails",           "~> 5.0"
gem "uglifier",             ">= 1.3.0"

gem "jbuilder",             "~> 2.5"
gem "jquery-rails",         "~> 4.3.1"
gem "turbolinks",           "~> 5"

# # Action Cable dependencies for the Redis adapter
# gem "redis",                "~> 3.0"

# Testing
group :test do
  gem "minitest"
  gem "simplecov", "~> 0.15.1", require: false
end

group :development do
  gem "web-console", ">= 3.3.0"
end
