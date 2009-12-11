# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  config.gem 'authlogic'
  config.gem 'formtastic'
  config.gem 'haml'
  config.gem 'RedCloth'
  config.gem 'searchlogic'
  config.gem 'will_paginate'
  config.gem "acts-as-taggable-on"
  config.gem "aws-s3", :lib => "aws/s3"

  config.time_zone = 'UTC'
  config.load_paths << "#{RAILS_ROOT}/app/models/gear"
end