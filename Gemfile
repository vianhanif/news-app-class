source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.3'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
gem 'bcrypt', '3.1.11'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'non-stupid-digest-assets', '~> 1.0.4'
gem 'jquery-turbolinks'
gem 'active_model_serializers'
# rails generate devise:install
gem 'devise'
gem "cocoon"
gem "font-awesome-rails"
# gem 'underscore-rails'
gem 'shareable'
# gem 'gmaps4rails'
# gem 'disqus_rails'
# gem 'pry-rails'
gem 'social-share-button'
gem 'bootstrap-sass'
gem 'bootstrap-datepicker-rails'
gem 'jasny-bootstrap-rails'
gem 'will_paginate'
gem 'simple_form'
gem 'carrierwave'
gem 'fog'
gem 'mini_magick'
gem 'carrierwave-imageoptimizer'
gem 'ckeditor'
gem 'acts-as-taggable-on'
# gem 'animate-rails'
gem 'carrierwave-base64'
# gem 'axlsx_rails'
gem 'fancybox2-rails'
gem "selectize-rails"
gem 'listen'
gem 'friendly_id', '~> 5.1.0'
gem 'video_info'
gem 'content_for_in_controllers'
gem 'betterlorem'

group :development, :test do
  gem 'byebug'
  gem 'rspec-rails'
  gem 'faker'
  gem 'ffaker'
  gem 'factory_girl_rails'
end

group :test do
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring', '~> 1.7', '>= 1.7.2'
end

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :production do
  gem 'rails_12factor', '0.0.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
