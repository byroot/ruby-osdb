module OSDb
  class Movie

    EXTENSIONS = %w(avi mpg m4v mkv mov ogv mp4)

    attr_reader :path, :id, :title, :year, :cover, :rating, :raw_data

    def initialize(path_or_data)
      if path_or_data.is_a?(Hash)
        initialize_from_hash(path_or_data)
      else
        initialize_from_path(path_or_data)
      end
    end

    def has_sub?
      exist = false
      %w(.srt .sub).each{ |ext| exist ||= File.exist?(path.gsub(File.extname(path), ext)) }
      exist
    end

    def sub_path(format)
      path.gsub(File.extname(path), ".#{format}")
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

    protected

    def initialize_from_hash(data)
      @id = data['id']
      @title = data['title']
      @year = data['year'] && data['year'].to_i
      @cover = data['cover']
      @rating = data['rating'] && data['rating'].to_f
      @raw_data = data
    end

    def initialize_from_path(path)
      @path = path
      @raw_data = {}
    end

  end
end
