source 'https://rubygems.org'

ruby '2.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
# Use postgresql as the database for Active Record
gem 'pg', '0.18.1'
# Use Bootstrap SASS
gem 'bootstrap-sass', '3.3.4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '2.7.1'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.0.3'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '2.2.13'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '0.4.1', group: :doc
# Slim syntatic sugar rails + HTML
gem 'slim-rails', '3.0.1'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Devise for user auth and facebook login
gem 'devise', '3.4.1'
# Email sender
gem 'mandrill-api', '1.0.53'
# Simple static pages
gem 'high_voltage', '2.3.0'

gem 'sprockets', '3.1.0'
gem 'sprockets-rails', '2.3.1'
# i18n
gem 'rails-i18n', '4.0.4'
# i18n for devise
gem 'devise-i18n', '0.12.0'
# Facebook login
gem 'omniauth-facebook', '2.0.1'
# Adminstrative panel
gem 'activeadmin', '1.0.0.pre1'
# Image uploader
gem 'carrierwave', github:'carrierwaveuploader/carrierwave'
gem 'acts_as_list', '0.7.2'
# Tree structure as a nested set for models
gem 'awesome_nested_set', '3.0.2'
# For consuming REST resources
gem 'rest-client', '1.8.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', '4.0.5'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '2.1.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '1.3.6'
  gem 'bullet', '4.14.7'
  # Hides env variables from repository
  gem 'dotenv-rails', '2.0.1'
  # Faster faker for generating stub content
  gem 'ffaker', '2.0.0'
end

group :development do
  # Open as a new tab the sent emails
  gem 'letter_opener', '1.4.0'
end

group :test do
  # Minitest reporters for formatting test results
  gem 'minitest-reporters', '1.0.14'
  # Better backtraces for mini test results on terminal
  gem 'mini_backtrace', '0.1.3'
end

group :production do
  # Gems for heroku server
  gem 'puma', '2.11.2'
  gem 'rails_12factor', '0.0.3'
end
