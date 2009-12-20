Tender::MultiPass.class_eval do
  # Fill these with real values.
  # See http://help.tenderapp.com/faqs/setup-installation/login-from-cookies for more info
  #
  self.site_key       = "signal-chains" # Found in your Tender site settings
  self.support_domain = "support.signalchains.com" # custom domain
  self.cookie_domain  = "signalchains.com"
end