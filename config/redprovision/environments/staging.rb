class Staging
  include Redprovision::Environment

  name 'staging'
  host 'Rackspace', {:username => 'guitsaru',
                     :api_key => '95123f69f2850861cd755becd2c9d81e',
                     :image_id => 14362,
                     :flavor_id => 1}

  # Add :ssh back in
  recipes :apt, :build_tools, :iptables, :deploy_user, :apache, :ruby, :passenger, :postgres,
          :signal_chains, :signal_chains_database
end
