module OSDb
  module Finder

    class Score

      def chose(items)
        items.max_by(&:score)
      end

    end

  end
end
