# frozen_string_literal: true

source "https://rubygems.org"

ruby "2.5.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "administrate"
gem "bcrypt", "~> 3.1.7"
gem "carrierwave"
gem "coffee-rails", "~> 4.2"
gem "fog-aws"
gem "forerunner"
gem "impressionist"
gem "interactor-rails"
gem "mailgun-ruby"
gem "mini_magick"
gem "pg", "~> 0.18"
gem "puma", "~> 3.7"
gem "pygments.rb"
gem "rails", "~> 5.1.4"
gem "redcarpet"
gem "sass-rails", "~> 5.0"
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "binding_of_caller"
  gem "byebug", platform: :mri
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rails-controller-testing"
  gem "rspec"
  gem "rspec-rails"
  gem "rspec_junit_formatter"
end

group :development do
  gem "annotate"
  gem "better_errors"
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "rubocop"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
end

gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
