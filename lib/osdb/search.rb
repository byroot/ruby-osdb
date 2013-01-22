module OSDb
  module Search
    base_path = File.expand_path(File.dirname(__FILE__) + '/search')
    autoload :IMDB,       "#{base_path}/imdb"
    autoload :MovieHash,  "#{base_path}/movie_hash"
    autoload :Name,       "#{base_path}/name"
    autoload :Path,       "#{base_path}/path"
  end
end
