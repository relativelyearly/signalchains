class Passenger
  include Redprovision::Recipe

  gem :passenger, :version => '2.2.7'
  apt 'apache2-prefork-dev'
  run 'passenger-install-apache2-module --auto'

  file 'passenger.conf' => '/etc/apache2/conf.d/passenger'
  run '/etc/init.d/apache2 restart'
end