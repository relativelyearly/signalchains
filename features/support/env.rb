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
require 'pickle/world'
# Example of configuring pickle:
#
# Pickle.configure do |config|
#   config.adapters = [:machinist]
#   config.map 'I', 'myself', 'me', 'my', :to => 'user: "me"'
# end
require 'pickle/path/world'
require 'pickle/email/world'

Dir.glob(File.dirname(__FILE__) + '/../../test/factories/*_factory.rb').each do |lib|
  require lib
end

require 'cucumber/thinking_sphinx/external_world'
Cucumber::ThinkingSphinx::ExternalWorld.new

# Transactional fixtures need to be false for sphinx
require 'database_cleaner'
Cucumber::Rails::World.use_transactional_fixtures = false
DatabaseCleaner.strategy = :truncation

Before do
  DatabaseCleaner.clean
end