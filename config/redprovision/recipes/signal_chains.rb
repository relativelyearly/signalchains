class SignalChains
  include Redprovision::Recipe

  gem :rails
  gem :haml
  gem :authlogic
  gem :formtastic
  gem 'RedCloth'
  gem :searchlogic
  gem :will_paginate
  gem 'acts-as-taggable-on'
  gem 'aws-s3'

  directory("/u",
    :user => 'deploy',
    :group => 'www-data')

  directory("/u/apps",
    :user => 'deploy',
    :group => 'www-data')

  directory("/u/apps/signalchains",
    :user => 'deploy',
    :group => 'www-data')

  directory("/u/apps/signalchains/releases",
    :user => 'deploy',
    :group => 'www-data')

  directory("/u/apps/signalchains/shared",
    :user => 'deploy',
    :group => 'www-data')

  directory("/u/apps/signalchains/shared/log",
    :user => 'deploy',
    :group => 'www-data')

  directory("/u/apps/signalchains/shared/system",
    :user => 'deploy',
    :group => 'www-data')
  
  directory("/u/apps/signalchains/shared/config",
    :user => 'deploy',
    :group => 'www-data')

  template({"database.yml.erb" => "/u/apps/signalchains/shared/config/database.yml"},
    :user => 'deploy',
    :group => 'www-data')

  timestamp = DateTime.now.strftime("%G%m%d%H%M")
  run "cd /u/apps/signalchains"
  run "cd /u/apps/signalchains", :user => 'deploy'
  run "ssh -o StrictHostKeyChecking=no git@github.com"
  run "git clone -q --depth 1 git@github.com:relativelyearly/signalchains.git /u/apps/signalchains/releases/#{timestamp}"
  run "chown -R deploy:www-data /u/apps/signalchains"
  run "ln -s /u/apps/signalchains/releases/#{timestamp} /u/apps/signalchains/current", :user => 'deploy'
  run "ln -s /u/apps/signalchains/shared/config/database.yml /u/apps/signalchains/current/config/database.yml", :user => 'deploy'
  run "cd /u/apps/signalchains && rake -f /u/apps/signalchains/releases/#{timestamp}/Rakefile gems:install RAILS_ENV=\#{environment == Staging ? 'staging' : 'production'}", :user => 'deploy'

  template({'signalchains.erb' => '/etc/apache2/sites-available/signalchains'},
    :user => 'deploy',
    :group => 'www-data')

  run "a2dissite default"
  run "a2ensite signalchains"
  run "a2enmod rewrite"
  run "/etc/init.d/apache2 restart"
end