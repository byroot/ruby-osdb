module OSDb
  module Finder
    base_path = File.expand_path(File.dirname(__FILE__) + '/finder')
    autoload :First,       "#{base_path}/first"
    autoload :Interactive, "#{base_path}/interactive"
    autoload :Score,       "#{base_path}/score"
  end
end
