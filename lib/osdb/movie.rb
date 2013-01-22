module OSDb
  class Movie

    attr_reader :id, :title, :year, :cover, :rating, :raw_data

    def initialize(data)
      @id = data['id']
      @title = data['title']
      @year = data['year'] && data['year'].to_i
      @cover = data['cover']
      @rating = data['rating'] && data['rating'].to_f
      @raw_data = data
    end

  end
end
