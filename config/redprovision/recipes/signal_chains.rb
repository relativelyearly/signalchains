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

  directory("/u") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  directory("/u/apps") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  directory("/u/apps/signalchains") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  directory("/u/apps/signalchains/releases") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  directory("/u/apps/signalchains/shared") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  directory("/u/apps/signalchains/shared/log") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  directory("/u/apps/signalchains/shared/system") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end
  
  directory("/u/apps/signalchains/shared/config") do |d|
    d.user 'deploy'
    d.group 'deploy'
  end

  file("database.yml" => "/u/apps/signalchains/shared/config/database.yml") do |f|
    f.user 'deploy'
    f.group 'www-data'
  end

  timestamp = DateTime.now.strftime("%G%m%d%H%M")
  run "cd /home/deploy"
  run "sudo -u deploy ssh -o StrictHostKeyChecking=no git@github.com"
  run "sudo -u deploy git clone -q --depth 1 git@github.com:relativelyearly/signalchains.git /u/apps/signalchains/releases/#{timestamp}"
  run "sudo -u deploy ln -s /u/apps/signalchains/releases/#{timestamp} /u/apps/signalchains/current"
  run "sudo -u deploy ln -s /u/apps/signalchains/shared/config/database.yml /u/apps/signalchains/current/config/database.yml"
  run "sudo -u deploy rake -f /u/apps/signalchains/releases/#{timestamp}/Rakefile gems:install RAILS_ENV=<%= environment.name == 'staging' ? 'staging' : 'production' %>"

  file('signalchains' => '/etc/apache2/sites-available/signalchains') do |f|
    f.user 'deploy'
    f.group 'www-data'
  end

  run "a2dissite default"
  run "a2ensite signalchains"
  run "a2enmod rewrite"
  run "/etc/init.d/apache2 restart"
end