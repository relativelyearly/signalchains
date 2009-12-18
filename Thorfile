require 'rubygems'
require 'redprovision'

class Redprovision < Thor
  ::Redprovision.init(File.dirname(__FILE__))

  map "-L" => :list

  desc "list", "List current servers"
  def list
    servers = ::Redprovision::Server.all

    puts "environment\t| id\t\t| ip address\t\t| created at"
    puts '='*80
    servers.each do |s|
      puts "#{s.environment.name}\t\t| #{s.id}\t| #{s.ip}\t| #{s.created_at.strftime('%Y-%m-%d %H:%M')}"
    end
  end

  ::Redprovision.environments.each do |env|
    desc env.name.downcase, "provisions a #{env.name} server"
    define_method(env.name.downcase.to_sym) do
      env.provision
    end
  end

  desc "destroy ID", "Destroy the server"
  def destroy(id)
    ::Redprovision::Server.get(id.to_i).destroy
  end
end
