require 'simplecov'
SimpleCov.start 'rails' do
  add_filter '/config/'
  add_filter '/lib/'
  add_filter '/test/'
  add_filter '/vendor/'

  add_group 'Admin', 'app/admin'
  add_group 'Controllers', 'app/controllers'
  add_group 'Helpers', 'app/helpers'
  add_group 'Inputs', 'app/inputs'
  add_group 'Mailers', 'app/mailers'
  add_group 'Models', 'app/models'
  add_group 'Uploaders', 'app/uploaders'
  add_group 'Views', 'app/views'
end

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

module ActiveSupport
  class TestCase < ::Minitest::Test
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

module ActionController
  class TestCase < ActiveSupport::TestCase
    include Devise::TestHelpers
  end
end
