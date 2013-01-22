module OSDb
  module Search

    class Name

      def initialize(server)
        @server = server
      end

      def search_subs_for(movie, language)
        subs = @server.search_subtitles(:sublanguageid => language, :query => movie.name)
        normalized_movie_name = normalize_name(movie.name)
        subs.select! do |sub|
          normalize_name(sub.filename).index(normalized_movie_name) # MAYBE: Levenshtein ?
        end
        subs
      end

      protected

      def normalize_name(name)
        name.downcase.gsub(/[\s\.\-\_]+/, ' ')
      end

    end

  end
end
