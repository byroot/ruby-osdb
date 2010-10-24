require 'uri'

module OSDb
  
  class Sub
    
    attr_reader :url, :format, :language, :rating, :movie_name, :raw_data
    
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