# Sets up the Rails environment for Cucumber
ENV["RAILS_ENV"] ||= "test"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')
require 'cucumber/rails/world'

# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'

require 'webrat'

Webrat.configure do |config|
  config.mode = :rails
end

require 'webrat/core/matchers'
