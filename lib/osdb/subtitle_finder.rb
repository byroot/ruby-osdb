module OSDb

  class SubtitleFinder

    def initialize(search_engines, finders, selectors=[])
      @search_engines = search_engines
      @finders = finders
      @selectors = selectors
    end

    def find_sub_for(movie, language)
      @search_engines.each do |engine|
        subs = engine.search_subs_for(movie, language)
        unless subs.nil?
          subs = @selectors.inject(subs) do |subs, selector|
            selector.select(subs, movie)
          end
          @finders.each do |finder|
            sub = finder.chose(subs)
            return sub if sub
          end
        end
      end

      nil
    end

  end

end
