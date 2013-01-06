module OSDb
  module Selector
    base_path = File.expand_path(File.dirname(__FILE__) + '/selector')
    autoload :Format, "#{base_path}/format"
    autoload :Movie,  "#{base_path}/movie"
  end
end
