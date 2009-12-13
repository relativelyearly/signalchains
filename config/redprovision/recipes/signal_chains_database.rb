class SignalChainsDatabase
  include Redprovision::Recipe

  run "cd /u/apps/signalchains && rake -f /u/apps/signalchains/current/Rakefile db:migrate RAILS_ENV=\#{environment == Staging ? 'staging' : 'production'}", :user => 'deploy'
  run "mkdir /u/apps/signalchains/current/tmp", :user => 'deploy'
  run "touch /u/apps/signalchains/current/tmp/restart.txt", :user => 'deploy'
end