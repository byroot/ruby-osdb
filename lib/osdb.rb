require 'xmlrpc/client'

module OSDb
  base_path = File.expand_path(File.dirname(__FILE__) + '/osdb')
  autoload :Movie,  "#{base_path}/movie"
  autoload :Server, "#{base_path}/server"
  autoload :Sub,    "#{base_path}/sub"
end