module GearHelper
  def new_button(gear_class)
    if @chain.nil?
      link_url = eval("new_#{gear_class.to_s.underscore}_path")
    else
      link_url = eval("new_chain_#{gear_class.to_s.underscore}_path(@chain)")
    end

    link_to "<span>#{image_tag 'icons/add.png'} New #{gear_class.to_s.underscore.humanize.titleize}</span>", link_url, :class => 'btn'
  end

  def gear_link(gear, text="#{gear.make} #{gear.model}")
    if @chain.nil?
      link_url = gear
    else
      link_url = eval("chain_#{gear.class.to_s.underscore}_path(@chain, gear)")
    end

    link_to text, link_url
  end

  def add_to_chain_button(gear)
    link_url = eval("add_#{gear.class.to_s.underscore}_path(:chain_id => @chain.id, :#{gear.class.to_s.underscore}_id => gear.id)")
    link_to '<span>Add to Chain</span>', link_url, :class => 'btn w15'
  end

  def gear_comments_path(gear)
    eval "#{gear.class.to_s.underscore}_comments_path(gear)"
  end
  
  def edit_gear_path(gear)
    eval("edit_#{gear.class.to_s.underscore}_path(gear)")
  end

  def most_used_gear
    if params[:controller] == "gear"
      @most_used ||= ThinkingSphinx.search('',
        :class => [Mic, Preamp, Equalizer, DynamicsProcessor, EffectsProcessor],
        :page => 1,
        :per_page => 6,
        :order => 'chain_gears_count DESC').compact
    else
      @most_used ||= ThinkingSphinx.search('',
        :class => [Mic, Preamp, Equalizer, DynamicsProcessor, EffectsProcessor],
        :page => 1,
        :per_page => 5,
        :order => 'chain_gears_count DESC').compact
    end
  end

  def recommend_link(gear)
    if current_user && current_user.recommends?(gear)
      link_to "<span>#{gear.recommendations.size}</span>", eval("recommend_#{gear.class.to_s.underscore}_path(gear)"), :class => 'like_btn unlike', :title => 'Don\'t recommend this gear', :rel => 'nofollow'
    else
      link_to "<span>#{gear.recommendations.size}</span>", eval("recommend_#{gear.class.to_s.underscore}_path(gear)"), :class => 'like_btn', :title => 'Recommend this gear', :rel => 'nofollow'
    end
  end
end
