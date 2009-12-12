class DeployUser
  include Redprovision::Recipe

  user("deploy",
    :group => 'www-data',
    :password => '705YR8jptajUcOb2KQnl')

  run "groupadd deploy"

  directory("/home/deploy/.ssh",
    :user => 'deploy',
    :group => 'deploy',
    :mode => '700')

  file({"authorized_keys" => "/home/deploy/.ssh/authorized_keys"},
    :user => 'deploy',
    :group => 'deploy',
    :mode => '600')

  file({"id_rsa" => "/home/deploy/.ssh/id_rsa"},
    :user => 'deploy',
    :group => 'deploy',
    :mode => '600')

  file({"id_rsa.pub" => "/home/deploy/.ssh/id_rsa.pub"},
    :user => 'deploy',
    :group => 'deploy',
    :mode => '600')

  directory("/root/.ssh",
    :mode => '700')

  file({"id_rsa" => "/root/.ssh/id_rsa"},
    :mode => '600')

  file({"id_rsa.pub" => "/root/.ssh/id_rsa.pub"},
    :mode => '600')

  run "echo 'AllowUsers deploy' >> /etc/ssh/sshd_config"
end
