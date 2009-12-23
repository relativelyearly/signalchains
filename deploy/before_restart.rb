run "rake -f #{release_path}/Rakefile ts:config"
run "rake -f #{release_path}/Rakefile ts:in"
run "/etc/init.d/monit restart"