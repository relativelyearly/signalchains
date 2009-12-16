class Chef
  include Redprovision::Recipe

  run 'gem sources -a http://gems.opscode.com'

  run 'hostname relativelyearly.com'

  gem 'json'
  gem 'ohai'
  gem 'chef'

  file('solo.rb' => '~/solo.rb')
  template('node.json.erb' => '~/node.json')

  run 'chef-solo -c ~/solo.rb -j ~/node.json -r http://signalchains-development.s3.amazonaws.com/cookbooks.tar.gz'
end