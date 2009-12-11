class DeployUser
  include Redprovision::Recipe

  user("deploy") do |u|
    u.group 'www-data'
    u.password '705YR8jptajUcOb2KQnl'
  end

  run "groupadd deploy"

  directory("/home/deploy/.ssh") do |d|
    d.user 'deploy'
    d.group 'deploy'
    d.mode '700'
  end

  file("authorized_keys" => "/home/deploy/.ssh/authorized_keys") do |f|
    f.user 'deploy'
    f.group 'deploy'
    f.mode '600'
  end

  file("id_rsa" => "/home/deploy/.ssh/id_rsa") do |f|
    f.user 'deploy'
    f.group 'deploy'
    f.mode '600'
  end
  
  file("id_rsa.pub" => "/home/deploy/.ssh/id_rsa.pub") do |f|
    f.user 'deploy'
    f.group 'deploy'
    f.mode '600'
  end

  run "echo 'AllowUsers deploy' >> /etc/ssh/sshd_config"
end
