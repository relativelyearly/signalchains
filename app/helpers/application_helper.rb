# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Block method that creates an area of the view that
  # is only rendered if the request is coming from an
  # anonymous user.
  def anonymous_only(&block)
    if !logged_in?
      block.call
    end
  end
  
  def title(page_title)
    content_for(:title) { page_title }
  end

  def gear_count
    Mic.count + Preamp.count + Equalizer.count + EffectsProcessor.count + DynamicsProcessor.count
  end

  # Block method that creates an area of the view that
  # only renders if the request is coming from an
  # authenticated user.
  def authenticated_only(&block)
    if logged_in?
      block.call
    end
  end

  def admin_only(&block)
    if current_user && current_user.admin?
      block.call
    end
  end

  def state_options
    [[ "Alabama", "AL" ], [ "Alaska", "AK" ], [ "Arizona", "AZ" ], [ "Arkansas", "AR" ], [ "California", "CA" ], [ "Colorado", "CO" ], [ "Connecticut", "CT" ], [ "Delaware", "DE" ], [ "District Of Columbia", "DC" ], [ "Florida", "FL" ], [ "Georgia", "GA" ], [ "Hawaii", "HI" ], [ "Idaho", "ID" ], [ "Illinois", "IL" ], [ "Indiana", "IN" ], [ "Iowa", "IA" ], [ "Kansas", "KS" ], [ "Kentucky", "KY" ], [ "Louisiana", "LA" ], [ "Maine", "ME" ], [ "Maryland", "MD" ], [ "Massachusetts", "MA" ], [ "Michigan", "MI" ], [ "Minnesota", "MN" ], [ "Mississippi", "MS" ], [ "Missouri", "MO" ], [ "Montana", "MT" ], [ "Nebraska", "NE" ], [ "Nevada", "NV" ], [ "New Hampshire", "NH" ], [ "New Jersey", "NJ" ], [ "New Mexico", "NM" ], [ "New York", "NY" ], [ "North Carolina", "NC" ], [ "North Dakota", "ND" ], [ "Ohio", "OH" ], [ "Oklahoma", "OK" ], [ "Oregon", "OR" ], [ "Pennsylvania", "PA" ], [ "Rhode Island", "RI" ], [ "South Carolina", "SC" ], [ "South Dakota", "SD" ], [ "Tennessee", "TN" ], [ "Texas", "TX" ], [ "Utah", "UT" ], [ "Vermont", "VT" ], [ "Virginia", "VA" ], [ "Washington", "WA" ], [ "West Virginia", "WV" ], [ "Wisconsin", "WI" ], [ "Wyoming", "WY" ]]
  end

  def state_options_with_blank(label = "")
    state_options.unshift([label, ""])
  end

  def full_state_name(state_abbrev)
    state_options.each do |full_name, abbrev|
      return full_name if abbrev == state_abbrev
    end
    nil
  end

  def javascripts
    javascript_include_tag('jquery-ui.custom.min.js',
                           'plugins/jquery.validate.js',
                           'jrails.js',
                           'plugins/jquery.form.js',
                           'plugins/jquery.scrollTo.js',
                           'plugins/jquery.localscroll.js',
                           '/fancybox/fancybox.js',
                           'plugins/jquery.cuteTime.js',
                           'application.js',
                           :cache => true)
  end
end
