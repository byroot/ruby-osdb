require 'ostruct'

module OSDb

  class LoginFailed < ::Exception
  end

  class Server

    attr_reader :username, :password, :language, :useragent, :client

    def initialize(options={})
      @username = options[:username] || ''
      @password = options[:password] || ''
      @language = options[:language] || 'eng'
      @useragent = options[:useragent] || 'ruby-osdb v0.1'
      @client = ::XMLRPC::Client.new(*options.values_at(:host, :path, :port, :proxy_host, :proxy_port, :http_user, :http_password, :use_ssl, :timeout))
    end

    def token
      @token ||= login
    end

    def login
      response = client.call('LogIn', username, password, language, useragent)
      if response['status'] != '200 OK'
        raise LoginFailed.new("Failed to login with #{username} : #{password}. Server return code: #{response['status']}")
      end
      response['token']
    end

    def logout
      client.call('LogOut', token)
      @token = nil
    end

    def check_movie_hash(*hashes)
      client.call('CheckMovieHash', token, hashes)
    end

    def search_subtitles(*queries)
      subs = client.call('SearchSubtitles', token, queries)['data']
      subs ? subs.map{ |s| Sub.new(s) } : []
    end

    def search_imdb(options={})
      query = options.delete(:query)
      imdb = client.call('SearchMoviesOnIMDB', token, query)['data']
      imdb ? imdb.map{ |i| OpenStruct.new(:imdbid => i['id'], :title => i['title']) } : []
    end

    def info
      client.call('ServerInfo')
    end

    def get_imdb_movie_details(id)
      client.call('GetIMDBMovieDetails', token, id)
    end

  end
end
