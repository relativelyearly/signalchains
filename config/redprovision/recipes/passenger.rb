class Passenger
  include Redprovision::Recipe

  gem :passenger
  apt 'apache2-prefork-dev'
  run 'passenger-install-apache2-module --auto'

passenger_config = <<-END
LoadModule passenger_module /usr/local/lib/ruby/gems/1.8/gems/passenger-2.2.7/ext/apache2/mod_passenger.so
   PassengerRoot /usr/local/lib/ruby/gems/1.8/gems/passenger-2.2.7
   PassengerRuby /usr/local/bin/ruby
END

  run "echo '#{passenger_config} >> '/etc/apache2/apache2.conf"
  run '/etc/init.d/apache2 restart'
end