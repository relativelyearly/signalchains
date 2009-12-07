module ChainsHelper
  def mp3_link(chain)
    if chain.audio.status == 'converted'
      link_to '<span>download mp3</span>', chain.audio.mp3.url, :class => 'btn'
    else
      'converting...'
    end
  end

  def ogg_link(chain)
    if chain.audio.status == 'converted'
      link_to '<span>download ogg</span>', chain.audio.ogg.url, :class => 'btn'
    else
      'converting...'
    end
  end

  def like_link(chain)
    if current_user && current_user.likes?(chain)
      link_to "<span>#{chain.likes.size}</span>", like_chain_path(chain), :id => 'like', :class => 'unlike'
    else
      link_to "<span>#{chain.likes.size}</span>", like_chain_path(chain), :id => 'like'
    end
  end
  
  def comments_link(chain)
    link_to "<span>#{chain.comments.size}</span>", '#comments', :id => 'comments_btn'
  end

  def complete_message
    capture_haml do
      haml_tag(:ul, :class => 'incomplete_chain') do
        unless @chain.audio.high_quality.file? && @chain.input_source? && @chain.preamp?
          haml_tag(:h4, 'This chain is incomplete')
          haml_tag(:p, 'In order for others to see your chain, you need to finish creating it.')          
        end

        unless @chain.audio.high_quality.file?
          haml_tag(:li, "It needs an <a href='#audio'>audio file</a>.")
        end

        unless @chain.input_source?
          haml_tag(:li, "It needs an <a href='#input_sources'>input source</a>.")
        end

        unless @chain.preamp?
          haml_tag(:li, "It needs a <a href='#extra_gear'>preamp</a>.")
        end
      end
    end
  end
end