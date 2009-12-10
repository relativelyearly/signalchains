class Ssh
  include Redprovision::Recipe

  file("sshd_config" => "/etc/ssh/sshd_config")
  run "/etc/init.d/ssh reload"
end
