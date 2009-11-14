module ChainsHelper
  def mp3_link(chain)
    if chain.audio.status == 'converted'
      link_to 'download mp3', chain.audio.mp3.url
    else
      'converting...'
    end
  end

  def ogg_link(chain)
    if chain.audio.status == 'converted'
      link_to 'download ogg', chain.audio.ogg.url
    else
      'converting...'
    end
  end

  def complete_message
    capture_haml do
      haml_tag(:ul, :class => 'incomplete_chain') do
        unless @chain.audio.high_quality.file? && @chain.input_source? && @chain.preamp?
          haml_tag(:h2, 'This chain is incomplete.')
        end

        unless @chain.audio.high_quality.file?
          haml_tag(:li, "It needs an audio file.")
        end

        unless @chain.input_source?
          haml_tag(:li, "It needs an input source.")
        end

        unless @chain.preamp?
          haml_tag(:li, "It needs a preamp.")
        end
      end
    end
  end
end