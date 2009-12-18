module Paperclip
  class Ogg < Processor
    attr_accessor :format

    def initialize(file, options = {}, attachment = nil)
      super

      @file = file
      @options = options
      @process = options[:ogg]
      @bitrate = options[:ogg][:bitrate] if @process

      @current_format = File.extname(attachment.original_filename)
      @basename = File.basename(@file.path, @current_format)

      @format = 'ogg'
    end

    def make
      @process.nil? ? @file : make!
    end

    def make!
      src = @file
      dst = Tempfile.new([@basename, @format].compact.join("."))
      dst.binmode

      command = <<-EOC
        -b #{@bitrate.to_i}
        -o #{File.expand_path(dst.path)}
        #{File.expand_path(src.path)}
      EOC

      begin
        success = Paperclip.run("oggenc", command.gsub(/\s+/, " "))
      rescue PaperclipCommandLineError
        raise PaperclipError, "There was an error processing the ogg for #{@basename}" if @whiny
      end

      dst
    end
  end
end