module ChainsHelper
  def complete_message
    capture_haml do
      haml_tag(:ul, :class => 'incomplete_chain') do
        unless @chain.audio.file? && @chain.input_source? && @chain.preamp?
          haml_tag(:h2, 'This chain is incomplete.')
        end

        unless @chain.audio.file?
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