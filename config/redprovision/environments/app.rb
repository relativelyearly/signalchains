class App
  include Redprovision::Environment

  name 'app'
  host 'Rackspace', {:username => 'guitsaru',
                     :api_key => '95123f69f2850861cd755becd2c9d81e',
                     :image_id => 14362,
                     :flavor_id => 1}

  recipes :apt, :build_tools, :iptables, :ssh, :deploy_user, :apache, :ruby, :passenger
end
