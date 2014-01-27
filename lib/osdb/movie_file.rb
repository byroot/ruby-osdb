module OSDb
  class MovieFile

    EXTENSIONS = %w(avi mpg m4v mkv mov ogv mp4)

    attr_reader :path, :language

    def initialize(path, language)
      @path = path
      @language = language
    end

    def has_sub?
      exist = false
      %w(srt sub).each{ |ext| exist ||= File.exist?(sub_path(ext)) }
      exist
    end

    def sub_path(format)
      extension = if @language
        ".#{@language}.#{format}"
      else
        ".#{format}"
      end
      path.gsub(File.extname(path), extension)
    end
    
    def hash
      @hash ||= self.class.compute_hash(path)
    end
    
    def size
      @size ||= File.size(path)
    end

    def name
      @name ||= File.basename(path, File.extname(path))
    end
    
    CHUNK_SIZE = 64 * 1024 # in bytes
    
    # from http://trac.opensubtitles.org/projects/opensubtitles/wiki/HashSourceCodes
    def self.compute_hash(path)
      filesize = File.size(path)
      hash = filesize
      
      # Read 64 kbytes, divide up into 64 bits and add each
      # to hash. Do for beginning and end of file.
      File.open(path, 'rb') do |f|    
        # Q = unsigned long long = 64 bit
        f.read(CHUNK_SIZE).unpack("Q*").each do |n|
          hash = hash + n & 0xffffffffffffffff # to remain as 64 bit number
        end
        
        f.seek([0, filesize - CHUNK_SIZE].max, IO::SEEK_SET)
        
        # And again for the end of the file
        f.read(CHUNK_SIZE).unpack("Q*").each do |n|
          hash = hash + n & 0xffffffffffffffff
        end
      end
      
      sprintf("%016x", hash)
    end

  end
end
