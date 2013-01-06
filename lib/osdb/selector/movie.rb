module OSDb
  module Selector

    class Movie

      def initialize(movie_finder=Finder::First.new)
        @movie_finder = movie_finder
      end

      def select(subs, movie)
        subs_by_movie = group_by_movie_name(subs)

        return subs if subs_by_movie.length <= 1

        movie_names = subs_by_movie.keys
        movie_name = @movie_finder.chose(movie_names)
        subs_by_movie[movie_name] || []
      end

      def group_by_movie_name(subs)
        subs.inject({}) do |hash, sub| 
          hash[sub.movie_name] ||= []
          hash[sub.movie_name] << sub
          hash
        end
      end

    end

  end
end
