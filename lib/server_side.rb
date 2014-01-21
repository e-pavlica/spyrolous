# Trying this from http://www.sitepoint.com/streaming-with-rails-4/ to fix streams not closing

require 'json'

module ServerSide

  class SSE
    def initialize io
      @io = io
    end
 
    def write object, options = {}
      options.each do |k,v|
        @io.write "#{k}: #{v}n"
      end
      @io.write "data: #{object}nn"
    end
 
    def close
      @io.close
    end
  end

end