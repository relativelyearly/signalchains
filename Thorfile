require 'rubygems'
require 'redprovision'

class Redprovision < Thor
  map "-L" => :list

  desc "list", "List current servers"
  def list
    puts Redprovision::Server.al
  end
end
