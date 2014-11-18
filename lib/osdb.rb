require 'xmlrpc/client'

module OSDb
  base_path = File.expand_path(File.dirname(__FILE__) + '/osdb')
  require "#{base_path}/xmlrpc_monkey_patch"

  autoload :Finder,         "#{base_path}/finder"
  autoload :Language,       "#{base_path}/language"
  autoload :Movie,          "#{base_path}/movie"
  autoload :MovieFile,      "#{base_path}/movie_file"
  autoload :Search,         "#{base_path}/search"
  autoload :Selector,       "#{base_path}/selector"
  autoload :Server,         "#{base_path}/server"
  autoload :Sub,            "#{base_path}/sub"
  autoload :SubtitleFinder, "#{base_path}/subtitle_finder"

  def self.default_language
    OSDb::Language.from_locale(ENV['LANG'] || 'en_US.UTF-8')
  end

end
