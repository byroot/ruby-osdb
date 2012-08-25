require 'uri'

module OSDb

  class Sub

    attr_reader :url, :format, :language, :rating, :user_ranks, :movie_name,
      :filename, :raw_data, :downloads_count, :bad_reports_count

    def initialize(data)
      @url = URI.parse(data['SubDownloadLink'])
      @format = data['SubFormat']
      @language = Language.from_iso639_2b(data['SubLanguageID'])
      @rating = data['SubRating'].to_f
      @user_ranks = data['UserRank']
      @movie_name = data['MovieName']
      @filename = data['SubFileName']
      @downloads_count = data['SubDownloadsCnt'].to_i
      @bad_reports_count = data['SubBad'].to_i
      @raw_data = data
    end

    def <=>(other)
      rating <=> other.rating
    end

    # Totaly subjective formula to evaluate subtitle quality
    # Originaly developed by runa (https://github.com/runa)
    # https://github.com/byroot/ruby-osdb/commit/9d71775#L0R122
    def score
      uploader_score * downloads_count.next * (rating + 1) - bad_reports_count / downloads_count.next
    end

    def uploader_score
      user_ranks.empty? ? 1 : 2
    end

  end

end
