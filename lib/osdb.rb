require 'xmlrpc/client'

module OSDb
  base_path = File.expand_path(File.dirname(__FILE__) + '/osdb')
  autoload :Language,  "#{base_path}/language"
  autoload :Movie,     "#{base_path}/movie"
  autoload :Server,    "#{base_path}/server"
  autoload :Sub,       "#{base_path}/sub"
  autoload :Options,   "#{base_path}/options"

  def self.log(str='')
    puts str unless options[:silent]
  end
  
  def self.options
    @@options ||= OSDb::Options.parse_options
  end
  
  def self.curl_available?
    %x{ curl --version 2> /dev/null > /dev/null }
    $?.success?
  end

  def self.wget_available?
    %x{ wget --version 2> /dev/null > /dev/null }
    $?.success?
  end
  
  def self.server
    @@server ||= OSDb::Server.new(
      :host => 'api.opensubtitles.org', 
      :path => '/xml-rpc', 
      :timeout => 90, 
      :useragent => "SubDownloader 2.0.10" # register useragent ? WTF ? too boring.
    ) 
  end
end
