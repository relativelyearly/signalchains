Paperclip.interpolates(:content_type_extension) do |attachment, style_name|
  case
    when ((style = attachment.styles[style_name]) && !style[:format].blank?) then style[:format]
    when style_name.to_s == 'ogg' then 'ogg'
    when style_name.to_s == 'mp3' then 'mp3'
  else
    File.extname(attachment.original_filename).gsub(/^\.+/, "")
  end
end