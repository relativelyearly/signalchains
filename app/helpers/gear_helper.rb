module GearHelper

  def new_button(gear_class)
    if @chain.nil?
      link_url = eval("new_#{gear_class.to_s.underscore}_path")
    else
      link_url = eval("new_chain_#{gear_class.to_s.underscore}_path(@chain)")
    end

    link_to "<span>New #{gear_class.to_s.underscore.humanize.titleize}</span>", link_url, :class => 'btn'
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
end
