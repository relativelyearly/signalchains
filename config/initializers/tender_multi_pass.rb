Tender::MultiPass.class_eval do
  # Fill these with real values.
  # See http://help.tenderapp.com/faqs/setup-installation/login-from-cookies for more info
  #
  self.site_key       = "d6bc048a11e2b70910d36d3026e7c1f78661cffbf0b16a07f7efc1ecd43b5b1f6f64b8b6081cf0f723c6d514207131fbb735f2a9715bc6c3ea0e36fb36d6ed53" # Found in your Tender site settings
  self.support_domain = "support.signalchains.com" # custom domain
  self.cookie_domain  = ".signalchains.com"
end