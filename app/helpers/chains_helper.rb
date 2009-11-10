module ChainsHelper
  def complete_message
    error = ""
    if !@chain.audio.file?
      error += "This chain is incomplete. It needs an audio file.\n"
    end

    unless @chain.input_source?
      error += "This chain is incomplete. It needs an input source.\n"
    end

    unless @chain.preamp?
      error += "This chain is incomplete. It needs a preamp.\n"
    end

    error
  end
end