class SignalChainsDatabase
  include Redprovision::Recipe

  run "sleep 5"
  run "sudo -u deploy rake -f /u/apps/signalchains/current/Rakefile db:migrate RAILS_ENV=<%= environment.name == 'staging' ? 'staging' : 'production' %>"
end