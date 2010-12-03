require 'xmlrpc/client'

module OSDb
  base_path = File.expand_path(File.dirname(__FILE__) + '/osdb')
  autoload :Language,  "#{base_path}/language"
  autoload :Movie,  "#{base_path}/movie"
  autoload :Server, "#{base_path}/server"
  autoload :Sub,    "#{base_path}/sub"

  def self.env_lang
    OSDb::Language.from_locale(ENV['LANG'])
  end
  
  def self.parse_options
    @@options = {:languages => [env_lang.to_iso639_2b], :force => false, :dir => nil, :silent => false }
    
    @parser ||= OptionParser.new do |opts|
      opts.banner = "Automatically download subs for your video files using opensubtitle.org"
      opts.separator ""
      opts.separator "Usage: getsub [options] DIRECTORY | VIDEO_FILE [VIDEO_FILE ...]"
      opts.separator ""
      opts.separator "Main options:"

      opts.on("-l", "--languages LANGUAGES", "Sub language ISO 963 code separated by comma's like fre or eng. Default: env $LANG (#{env_lang.to_iso639_2b})") do |languages|
        @@options[:languages] = languages.split(',')
      end

      opts.on("-d", "--directory DIRECTORY", "Specify a directory to search recursively for movies") do |dir|
        @@options[:dir] = dir
      end

      opts.on("-f", "--force", "Download sub even if video already has one") { @@options[:force] = true }

      opts.on("-s", "--silent", "Don't output anything") { options[:silent] = true }
    end
    @parser.parse!

    if !@@options[:dir] && ARGV.empty?
      puts OSDb.help
      exit 1
    end

    @@options
  end
  
  def self.help
    @parser.help
  end
  
  def self.options
    @@options ||= parse_options
  end
  
  def self.log(str='')
    unless options[:silent]
      puts str
    end
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
