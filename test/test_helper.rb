ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# NOTE: because we are using mongoid we have to manually include this to get the macros for active record
require 'shoulda'
require 'factory_girl'
require 'shoulda/active_record'

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end
