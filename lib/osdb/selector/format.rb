module OSDb
  module Selector

    class Format

      def initialize(formats)
        @formats = formats
      end

      def select(subs, movie)
        subs.select{ |s| @formats.include?(s.format) }
      end

    end

  end
end
