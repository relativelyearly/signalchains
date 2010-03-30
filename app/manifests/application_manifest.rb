require "#{File.dirname(__FILE__)}/../../vendor/plugins/moonshine/lib/moonshine.rb"
class ApplicationManifest < Moonshine::Manifest::Rails
  # The majority of your configuration should be in <tt>config/moonshine.yml</tt>
  # If necessary, you may provide extra configuration directly in this class
  # using the configure method. The hash passed to the configure method is deep
  # merged with what is in <tt>config/moonshine.yml</tt>. This could be used,
  # for example, to store passwords and/or private keys outside of your SCM, or
  # to query a web service for configuration data.
  #
  # In the example below, the value configuration[:custom][:random] can be used in
  # your moonshine settings or templates.
  #
  # require 'net/http'
  # require 'json'
  # random = JSON::load(Net::HTTP.get(URI.parse('http://twitter.com/statuses/public_timeline.json'))).last['id']
  # configure({
  #   :custom => { :random => random  }
  # })

  configure({
    :ssh => { :port => 30000, :allow_users => ['rails'] },
    :iptables => { :rules => [
      '-A INPUT -m state —state RELATED,ESTABLISHED -j ACCEPT',
      '-A INPUT -p icmp -j ACCEPT',
      '-A INPUT -p tcp -m tcp —dport 25 -j ACCEPT',
      '-A INPUT -p tcp -m tcp —dport 30000 -j ACCEPT',
      '-A INPUT -p tcp -m tcp —dport 80 -j ACCEPT',
      '-A INPUT -p tcp -m tcp —dport 443 -j ACCEPT',
      '-A INPUT -s 127.0.0.1 -j ACCEPT',
      '-A INPUT -p tcp -m tcp —dport 8000:10000 -j ACCEPT',
      '-A INPUT -p udp -m udp —dport 8000:10000 -j ACCEPT'
    ]}
  })


  # The default_stack recipe install Rails, Apache, Passenger, the database from
  # database.yml, Postfix, Cron, logrotate and NTP. See lib/moonshine/manifest/rails.rb
  # for details. To customize, remove this recipe and specify the components you want.
  recipe :default_stack

  # Add your application's custom requirements here
  def application_packages
    # If you've already told Moonshine about a package required by a gem with
    # :apt_gems in <tt>moonshine.yml</tt> you do not need to include it here.
    # package 'some_native_package', :ensure => :installed

    # some_rake_task = "/usr/bin/rake -f #{configuration[:deploy_to]}/current/Rakefile custom:task RAILS_ENV=#{ENV['RAILS_ENV']}"
    # cron 'custom:task', :command => some_rake_task, :user => configuration[:user], :minute => 0, :hour => 0
    thinking_sphinx_task = "/usr/bin/rake -f #{configuration[:deploy_to]}/current/Rakefile ts:rebuild RAILS_ENV=#{ENV['RAILS_ENV']}"
    cron 'ts:rebuild', :command => thinking_sphinx_task, :user => configuration[:user], :minute => '*/15'

    # %w( root rails ).each do |user|
    #   mailalias user, :recipient => 'you@domain.com'
    # end

    # farm_config = <<-CONFIG
    #   MOOCOWS = 3
    #   HORSIES = 10
    # CONFIG
    # file '/etc/farm.conf', :ensure => :present, :content => farm_config


    matt_ssh_key = <<-END
ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEAv0klC6nK2tnAHoqrUJuXUcjh4vfMH36y1eCpdj5SFwo1ohX+NvxIkvbDWOpjiSDR3oDRvGf/+v5rnI4iHxS/odnl9NJy1nq3pLC91WOmUGWqlWXVSnJ4qH2zDrVwtdqztMgAqaGawvajxMsyuZpmbnDZJM/7uzkbnrvKoLL5QbuM14pSNK/t3lWVMzC68KonaaFOGG/QgSnlOO+uFEJxxynbr9TyRObvM1ALMcWeqWL2s3W0I/bCwvFCLaZnG/ZWp/+CpZ3acwQFwttYn7iC04S+XhzJU8iWLwzYr4DzKnchyJyHw9zTJcG5SO/Ihqb7/DaAmgMm0xnxjEatbwRUkQ== matt@Auk.local
END

    file '/home/rails/.ssh/authorized_keys', :ensure => :present, :content => [matt_ssh_key].join('\n')

    # Logs for Rails, MySQL, and Apache are rotated by default
    # logrotate '/var/log/some_service.log', :options => %w(weekly missingok compress), :postrotate => '/etc/init.d/some_service restart'

    # Only run the following on the 'testing' stage using capistrano-ext's multistage functionality.
    # on_stage 'testing' do
    #   file '/etc/motd', :ensure => :file, :content => "Welcome to the TEST server!"
    # end

    exec "ts:in", :command => "/usr/bin/rake -f #{configuration[:deploy_to]}/current/Rakefile ts:in RAILS_ENV=#{ENV['RAILS_ENV']}", :user => configuration[:user]

    #exec "install java",
      #:command => "yes 'yes' | DEBIAN_FRONTEND=Readline apt-get install sun-java6-jre",
      #:creates => '/usr/bin/java'

    package 'imagemagick', :ensure => :installed
    package 'libmagick9-dev', :ensure => :installed
    package 'vorbis-tools', :ensure => :installed
    package 'libmp3lame-dev', :ensure => :installed
    package 'subversion', :ensure => :installed
    package 'checkinstall', :ensure => :installed

    exec "build ffmpeg",
      :command => ['svn checkout svn://svn.mplayerhq.hu/ffmpeg/trunk ffmpeg',
                   'cd ffmpeg',
                   './configure --enable-gpl --enable-postproc --enable-swscale --disable-debug --enable-libmp3lame --enable-pthreads --prefix=/usr',
                   'checkinstall'].join(' && '),
      :cwd => '/tmp',
      :creates => '/usr/bin/ffmpeg'

  end
  # The following line includes the 'application_packages' recipe defined above
  recipe :application_packages
  plugin :god
  recipe :god
  plugin :sphinx
  recipe :sphinx
  plugin :iptables
  recipe :iptables
  plugin :ssh
  recipe :ssh
end
