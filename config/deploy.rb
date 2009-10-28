set :application, ""
set :repository,  ""
set :user, "deploy"
set :deploy_via, :fast_remote_cache
set :scm, :git
 
# Customise the deployment
set :keep_releases, 6
after "deploy:update", "deploy:cleanup"
 
# directories to preserve between deployments
# set :asset_directories, ['public/system/logos', 'public/system/uploads']
 
# re-linking for config files on public repos  
namespace :deploy do
  desc "Re-link config files"
  task :link_config, :roles => :app do
    run "ln -nsf \#{shared_path}/config/database.yml \#{current_path}/config/database.yml"
  end
end