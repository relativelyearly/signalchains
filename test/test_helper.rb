ENV["RAILS_ENV"] = "test"
require File.expand_path(File.dirname(__FILE__) + "/../config/environment")
require 'test_help'
require 'shoulda'
require 'mocha'
require "authlogic/test_case"

class ActionController::TestCase
  self.use_transactional_fixtures = true
  self.use_instantiated_fixtures  = false
  
  setup :activate_authlogic
end
