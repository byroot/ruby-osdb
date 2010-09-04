require 'uri'

module OSDb
  
  class Sub
    
    attr_reader :url, :format, :language, :rating, :raw_data
    
    def initialize(data)
      @url = URI.parse(data['SubDownloadLink'])
      @format = data['SubFormat']
      @language = Language.from_iso639_2b(data['SubLanguageID'])
      @rating = data['SubRating']
      @raw_data = data
    end
    
  end
  
end