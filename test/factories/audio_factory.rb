Factory.define :audio do |audio|
  audio.file { ActionController::TestUploadedFile.new(File.join(File.dirname(__FILE__), '..', 'audio_files', 'guitar.aif'), Mime::Type.new('audio/aiff')) }
end