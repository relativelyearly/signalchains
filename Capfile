load 'deploy' if respond_to?(:namespace) # cap2 differentiator
Dir['vendor/plugins/*/recipes/*.rb'].each { |plugin| load(plugin) }
load 'config/deploy'

require 'redprovision'

root = File.dirname(__FILE__)
Redprovision.init(root)

require 'redprovision/capistrano'
