class Apt
  include Redprovision::Recipe

  run "sudo locale-gen en_US.UTF-8"
  run "sudo /usr/sbin/update-locale LANG=en_US.UTF-8"
  run "aptitude update -y"
  run "aptitude safe-upgrade -y"
  run "aptitude full-upgrade -y"
end
