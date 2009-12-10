class Iptables
  include Redprovision::Recipe

  apt "iptables"
  file "iptables.test.rules" => "/etc/iptables.test.rules"
  run "iptables-restore < /etc/iptables.test.rules"
  run "iptables-save > /etc/iptables.up.rules"
  file "interfaces" => "/etc/network/interfaces"
end
