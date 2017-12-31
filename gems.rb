# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails',                '5.0.0.1'

# Database Adapter
gem 'pg',                   '0.19.0'

# Gems used by project
gem 'devise',               '~> 4.2.0'
gem 'bootstrap-sass',       '~> 3.3.7'
gem 'kaminari',             '~> 0.17.0'
gem 'haml',                 '~> 4.0.7'
gem 'figaro',               '~> 1.1.1'
gem 'carrierwave',          '~> 0.11.2'
gem 'font-awesome-rails'

# Rails Defaults
gem 'coffee-rails',         '~> 4.2'
gem 'sass-rails',           '~> 5.0'
gem 'uglifier',             '>= 1.3.0'

gem 'jbuilder',             '~> 2.0'
gem 'jquery-rails',         '~> 4.2.1'
gem 'turbolinks',           '~> 5'

# # Action Cable dependencies for the Redis adapter
# gem 'redis',                '~> 3.0'

# Testing
group :test do
  gem 'minitest'
  gem 'simplecov',          '~> 0.12.0', require: false
end

group :development do
  gem 'web-console', '~> 3.0'
end
