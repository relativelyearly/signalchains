default_run_options[:pty] = true

set :application, "signalchains"
set :repository,  "git@github.com:relativelyearly/signalchains.git"
set :user, "deploy"
set :deploy_via, :remote_cache
set :scm, :git
set :deploy_to, '/data/signalchains'

set :host, '72.14.191.62'
role :app, host
role :web, host
role :db,  host

# ssh_options[:port] = 30000

set :backup_database_before_migrations, false
set :disable_web_during_migrations,     true
set :build_gems,                        false
set :tag_on_deploy,                     false
set :cleanup_on_deploy,                 false
set :compress_assets,                   false

# Customise the deployment
set :keep_releases, 6
after "deploy:update", "deploy:cleanup"

# directories to preserve between deployments
# set :asset_directories, ['public/system/logos', 'public/system/uploads']


Dir[File.join(File.dirname(__FILE__), '..', 'vendor', 'gems', 'hoptoad_notifier-*')].each do |vendored_notifier|
  $: << File.join(vendored_notifier, 'lib')
end

require 'hoptoad_notifier/capistrano'
