module OSDb
  module Finder

    class Interactive

      def chose(items)
        puts "D'oh! You stumbled upon a hash conflict, please resolve it:"
        puts
        items.each_with_index do |name, index|
          puts " #{index} - #{name}"
        end
        print 'id: '
        str = STDIN.gets # TODO: rule #1, never trust user input
        puts
        items[str.to_i]
      end

    end

  end
end
