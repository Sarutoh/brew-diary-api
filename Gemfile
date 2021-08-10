# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.0'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'devise'
gem 'devise-jwt'
gem 'fast_jsonapi'
gem 'graphql', '~> 1.12', '>= 1.12.14'
gem 'jbuilder', '~> 2.7'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.4'
gem 'rubocop-rails', '~> 2.11', '>= 2.11.3'
gem 'rubocop-rspec', require: false
gem 'sass-rails', '>= 6'
gem 'simplecov', '~> 0.21.2'
gem 'webpacker', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'faker', '~> 2.18'
  gem 'rspec-rails', '~> 5.0', '>= 5.0.1'
end

group :development do
  gem 'annotate', '~> 3.1', '>= 3.1.1'
  gem 'listen', '~> 3.3'
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'web-console', '>= 4.1.0'
end

gem 'graphiql-rails', group: :development
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
