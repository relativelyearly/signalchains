module Paperclip
  module Storage
    module S3
      def flush_writes #:nodoc:
        @queued_for_write.each do |style, file|
          begin
            log("saving #{path(style)}")

            case style
            when :ogg then content_type = 'audio/ogg'
            when :mp3 then content_type = 'audio/mpeg'
            else content_type = instance_read(:content_type)
            end

            AWS::S3::S3Object.store(path(style),
                                    file,
                                    bucket_name,
                                    {:content_type => content_type,
                                     :access => @s3_permissions,
                                    }.merge(@s3_headers))
          rescue AWS::S3::ResponseError => e
            raise
          end
        end
        @queued_for_write = {}
      end
    end
  end
end