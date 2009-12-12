class SignalChainsDatabase
  include Redprovision::Recipe

  run "cd /u/apps/signalchains/current"
  run "rake -f /u/apps/signalchains/current/Rakefile db:migrate RAILS_ENV=\#{environment == Staging ? 'staging' : 'production'}", :user => 'deploy'
end