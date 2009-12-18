module Paperclip
  class Mp3 < Processor
    attr_accessor :format
    
    def initialize(file, options = {}, attachment = nil)
      super

      @file = file
      @options = options
      @process = options[:mp3]
      @bitrate = options[:mp3][:bitrate] if @process

      @current_format = File.extname(attachment.original_filename)
      @basename = File.basename(@file.path, @current_format)

      @format = 'mp3'
    end

    def make
      @process.nil? ? @file : make!
    end

    def make!
      src = @file
      dst = Tempfile.new([@basename, @format].compact.join("."))
      dst.binmode

      command = <<-EOC
        -i #{File.expand_path(src.path)}
        -acodec libmp3lame
        -f mp3
        -vn
        -ab #{@bitrate}
        -ac 2
        -y
        #{File.expand_path(dst.path)}
      EOC

      begin
        success = Paperclip.run("ffmpeg", command.gsub(/\s+/, " "))
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error processing the mp3 for #{@basename}" if @whiny
      end

      dst
    end
  end
end