module OSDb
  class Options

    class << self
      def env_lang
        OSDb::Language.from_locale(ENV['LANG'])
      end

      def parse_options
        @@options = {:languages => [env_lang.to_iso639_2b], :force => false, :dir => nil, :silent => false }

        @@parser ||= OptionParser.new do |opts|
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
        @@parser.parse!

        if !@@options[:dir] && ARGV.empty?
          help
          exit 1
        end

        @@options
      end

      def help
        puts @@parser.help
      end
    end

  end
end
