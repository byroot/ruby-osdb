require 'uri'

module OSDb
  
  class Sub
    
    attr_reader :url, :format, :language, :rating, :movie_name, :raw_data

    def self.download!(url, local_path)
      OSDb.log "* download #{url} to #{local_path}"
      if OSDb.curl_available?
        %x{ curl -s '#{url}' | gunzip > "#{local_path}" }
      elsif OSDb.wget_available?
        %x{ wget -O -quiet - '#{url}' | gunzip > "#{local_path}"}
      else
        OSDb.log "Can't found any curl or wget please install one of them or manualy download your sub"
        OSDb.log url
      end
    end

    
    def initialize(data)
      @url = URI.parse(data['SubDownloadLink'])
      @format = data['SubFormat']
      @language = Language.from_iso639_2b(data['SubLanguageID'])
      @rating = data['SubRating'].to_f
      @movie_name = data['MovieName']
      @raw_data = data
    end
    
    def <=>(other)
      rating <=> other.rating
    end
    
  end
  
end