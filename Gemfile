source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', '4.2.1'
gem 'pg', '0.18.1'
gem 'bootstrap-sass', '3.3.4.1'
gem 'sass-rails', '5.0.3'
gem 'uglifier', '2.7.1'
gem 'coffee-rails', '4.1.0'
gem 'jquery-rails', '4.0.3'
gem 'turbolinks', '2.5.3'
gem 'jbuilder', '2.2.13'
gem 'sdoc', '0.4.1', group: :doc
gem 'slim-rails', '3.0.1'
gem 'slim', '3.0.3' # Same version of slim-rails. It's here due to brakeman
gem 'devise', '3.4.1'
gem 'mandrill-api', '1.0.53'
gem 'high_voltage', '2.3.0'
gem 'paranoia', '2.1.2'
gem 'sprockets', '3.1.0'
gem 'sprockets-rails', '2.3.1'
gem 'rails-i18n', '4.0.4'
gem 'devise-i18n', '0.12.0'
gem 'omniauth-facebook', '2.0.1'
gem 'activeadmin', '1.0.0.pre1'
gem 'carrierwave', github:'carrierwaveuploader/carrierwave'

group :development, :test do
  gem 'byebug', '4.0.5'
  gem 'sqlite3', '1.3.10'
  gem 'web-console', '2.1.2'
  gem 'spring', '1.3.6'
  gem 'guard', '2.12.5'
  gem 'guard-rubycritic', '1.4.0'
  gem 'bullet', '4.14.7'
  gem 'dotenv-rails', '2.0.1'
  gem 'ffaker', '2.0.0'
end

group :development do
  gem 'letter_opener', '1.4.0'

  # Do not load these helper gems on the application
  # Always use the lastest version
  gem 'rubycritic', require: false
  gem 'brakeman',   require: false
  gem 'rubocop',    require: false
end

group :test do
  gem 'minitest-reporters', '1.0.14'
  gem 'mini_backtrace', '0.1.3'
  gem 'guard-minitest', '2.3.1'
  gem 'simplecov', '0.10.0', require: false
end

group :production do
  gem 'puma', '2.11.2'
  gem 'rails_12factor', '0.0.3'
end
