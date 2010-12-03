require 'uri'

module OSDb
  
  class Sub
    
    attr_reader :url, :format, :language, :rating, :movie_name, :raw_data

    class << self
      def fetch
        movies = Movie.get_movie_list
        
        movies.each do |movie|
          begin
            OSDb.log "* search subs for: #{movie.path}"
            subs = OSDb.server.search_subtitles(:moviehash => movie.hash, :moviebytesize => movie.size, :sublanguageid => OSDb.options[:languages].join(','))
            if subs.any?
              sub = select_sub(subs)
              sub_path = movie.sub_path(sub.format)
              Sub.download!(sub.url, sub_path)
            else
              OSDb.log "* no sub found"
            end
            OSDb.log
          end
        end
      end

      def download!(url, local_path)
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

      private
        def select_sub(subs)
          return subs.first if subs.length == 1
          movies = group_by_movie_name(subs)
          return movies.values.first.max if movies.length == 1
          selected_movie_subs = ask_user_to_identify_movie(movies)
          selected_movie_subs.max
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