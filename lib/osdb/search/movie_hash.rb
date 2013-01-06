module OSDb
  module Search

    class MovieHash

      def initialize(server)
        @server = server
      end

      def search_subs_for(movie, language)
        @server.search_subtitles(
          :moviehash => movie.hash,
          :moviebytesize => movie.size.to_s,
          :sublanguageid => language
        )
      end

    end

  end
end
