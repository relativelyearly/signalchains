class SignalChainsDatabase
  include Redprovision::Recipe

  run "cd /u/apps/signalchains/current"
  run "sudo -u deploy rake db:migrate RAILS_ENV=<%= environment.name == 'staging' ? 'staging' : 'production' %>"
end