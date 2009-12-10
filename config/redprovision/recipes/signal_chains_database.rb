class SignalChainsDatabase
  include Redprovision::Recipe

  run "rake -f /u/apps/signalchains/current/Rakefile db:migrate RAILS_ENV=<%= environment.name == 'staging' ? 'staging' : 'production' %>"
end