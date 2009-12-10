class Apache
  include Redprovision::Recipe

  apt 'apache2'
  apt 'apache2.2-common'
  apt 'apache2-mpm-prefork'
  apt 'apache2-utils'
  apt 'libexpati'
  apt 'ssl-cert'

  run 'echo "ServerName <%= name %>" >> /etc/apache2/apache2.conf'
  run 'apache2ctl graceful'

  domain ':name', 'signalchains.com', {:username => 'matt@relativelyearly.com', :api_key => '820f42cf1e2a3f95252c7f76cde9be76'}
end