require 'uri'

module OSDb
  
  class Sub
    
    attr_reader :url, :format, :language, :rating, :movie_name, :filename, :raw_data
    
    def initialize(data)
      @url = URI.parse(data['SubDownloadLink'])
      @format = data['SubFormat']
      @language = Language.from_iso639_2b(data['SubLanguageID'])
      @rating = data['SubRating'].to_f
      @movie_name = data['MovieName']
      @filename = data['SubFileName']
      @raw_data = data
    end
    
    def <=>(other)
      rating <=> other.rating
    end
    
  end
  
end