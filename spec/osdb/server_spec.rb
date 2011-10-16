require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::Server do

  before :all do
    @server = OSDb::Server.new(
      :host => 'api.opensubtitles.org',
      :path => '/xml-rpc',
      :timeout => 60, # OS.org is very very slow ....
      :useragent => 'OS Test User Agent'
    )
  end

  subject { @server }

  let(:expected_info) do
    {
      "website_url"=>"http://www.opensubtitles.org",
      "contact"=>"admin@opensubtitles.org",
      "application"=>"OpenSuber v0.2",
      "xmlrpc_version"=>"0.1",
      "xmlrpc_url"=>"http://api.opensubtitles.org/xml-rpc"
    }
  end

  it 'should respond to #info' do
    info = subject.info
    expected_info.each do |key, value|
      info[key].should == value
    end
    info['seconds'].should be_a(Float)
    info['last_update_strings'].should be_a(Hash)
  end

  it 'should automatically call #login when token is needed' do
    subject.instance_variable_get('@token').should be_nil
    subject.token.should match(/[a-z0-9]{26}/)
    subject.instance_variable_get('@token').should == subject.token
  end

  it 'should clear @login after #logout' do
    expect{
      subject.logout
    }.to change{ subject.instance_variable_get('@token') }.from(instance_of(String)).to(nil)
  end

  describe "#check_movie_hash" do

    it 'should identify movie' do
      subject.check_movie_hash('37d0c7d0cfcbe280')['data'].should == {
        "37d0c7d0cfcbe280" => {
          "MovieYear" => "1996",
          "MovieImdbID" => "0117500",
          "MovieName" => "The Rock",
          "MovieHash" => "37d0c7d0cfcbe280"
        }
      }
    end

  end

  describe '#search_subtitles' do

    it 'can search by hash and size' do
      subs = subject.search_subtitles(:moviehash => 'bd71526264fd8bd9', :moviebytesize => '183406990', :sublanguageid => 'fre')
      subs.should be_a(Array)
      subs.length.should >= 2
      subs.each do |sub|
        sub.language.name.should == 'French'
        sub.raw_data['MovieName'].should == 'How I Met Your Mother'
      end
    end

    it 'can search by imdbid' do
      subs = subject.search_subtitles(:imdbid => "0117500", :sublanguageid => 'fre')
      subs.should be_a(Array)
      subs.length.should >= 1
      subs.each do |sub|
        sub.language.name.should == 'French'
        sub.raw_data['MovieName'].should == 'The Rock'
      end
    end

  end

  describe "#search_imdb" do
    it "can search imdb by title" do
      imdb = subject.search_imdb(:query => "How I Met Your Mother")
      imdb.length.should == 1
      imdb.each do |movie|
        movie.id.should == '0460649'
        movie.title.should == 'How I Met Your Mother'
      end
    end
  end

end
