module ChainsHelper
  def complete_message
    error = ""
    if !@chain.audio.file?
      error += "This chain is incomplete. It needs an audio file.\n"
    end

    error
  end
end