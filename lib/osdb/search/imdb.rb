module OSDb
  module Search

    class IMDB

      def initialize(server, selector=Finder::First.new)
        @server = server
        @selector = selector
      end

      def search_subs_for(movie, language)
        imdb_results = @server.search_imdb(:query => movie.name)
        return if imdb_results.size == 0
        return if imdb_results.class != Hash
        return if imdb_results[:imdbid] == nil
        if imdb_result = @selector.chose(imdb_results)
          @server.search_subtitles(
            :sublanguageid => language,
            :imdbid => imdb_result.imdbid
          )
        end
      end

    end

  end
end
