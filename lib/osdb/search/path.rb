module OSDb
  module Search

    class Path

      def initialize(server)
        @server = server
      end

      def search_subs_for(movie, language)
        @server.search_subtitles(
          :sublanguageid => language,
          :tag => movie.path
        )
      end

    end

  end
end
