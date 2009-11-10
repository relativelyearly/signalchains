# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.4' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'authlogic'
  config.gem 'justinfrench-formtastic', :lib => 'formtastic', :source => 'http://gems.github.com'
  config.gem 'haml'
  config.gem 'RedCloth'
  config.gem 'binarylogic-searchlogic', :lib => 'searchlogic', :source => 'http://gems.github.com'
  config.gem 'will_paginate'
  config.gem "acts-as-taggable-on"
  config.gem 'right_aws'

  config.time_zone = 'UTC'
  config.load_paths << "#{RAILS_ROOT}/app/models/gear"
end