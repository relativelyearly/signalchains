run "rake -f #{release_path}/Rakefile ts:config"
run "rake -f #{release_path}/Rakefile ts:in"
sudo "monit reload"
sudo "monit start all"