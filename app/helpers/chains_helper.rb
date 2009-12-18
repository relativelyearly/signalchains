module ChainsHelper
  def mp3_link(chain)
    link_to '<span>mp3</span>', chain.audio.file.url(:mp3), :class => 'btn'
  end

  def ogg_link(chain)
    link_to '<span>ogg</span>', chain.audio.file.url(:ogg), :class => 'btn'
  end

  def like_link(chain)
    if current_user && current_user.likes?(chain)
      link_to "<span>#{chain.likes.size}</span>", like_chain_path(chain), :id => 'like', :class => 'unlike', :title => 'Unlike this chain'
    else
      link_to "<span>#{chain.likes.size}</span>", like_chain_path(chain), :id => 'like', :title => 'Like this chain'
    end
  end

  def comments_link(chain)
    link_to "<span>#{chain.comments.size}</span>", '#comments', :id => 'comments_btn'
  end

  def chain_owner(chain, &block)
    if current_user == chain.user
      block.call
    end
  end

  def complete_message
    capture_haml do
      haml_tag(:ul, :class => 'incomplete_chain') do
        unless @chain.audio.file.file? && @chain.input_source? && @chain.preamp?
          haml_tag(:h4, 'This chain is incomplete')
          haml_tag(:p, 'In order for others to see your chain, you need to finish creating it.')
        end

        unless @chain.audio.file.file?
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