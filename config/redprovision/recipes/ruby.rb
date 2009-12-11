class Ruby
  include Redprovision::Recipe

  dpkg('http://rubyforge.org/frs/download.php/66163/ruby-enterprise_1.8.7-2009.10_amd64.deb')
end