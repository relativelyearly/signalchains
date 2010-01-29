ActiveSupport::CoreExtensions::Time::Conversions::DATE_FORMATS.merge!(
  :us => '%m/%d/%y',
  :us_with_time => '%m/%d/%y, %l:%M %p',
  :short_day => '%e %B %Y',
  :long_day => '%A, %e %B %Y'
)

Date::DATE_FORMATS[:human] = "%B %e, %Y"
Time::DATE_FORMATS[:w3c] = lambda {|time| time.utc.strftime("%Y-%m-%dT%H:%M:%S+00:00") }