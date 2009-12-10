class BuildTools
  include Redprovision::Recipe

  apt :'build-essential'
  apt :'git-core'
end
