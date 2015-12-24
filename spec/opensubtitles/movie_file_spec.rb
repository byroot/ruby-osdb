require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Opensubtitles::MovieFile do
  
  subject do
    Opensubtitles::MovieFile.new(File.dirname(__FILE__) + '/../fixtures/somemovie.avi')
  end
  
  its(:hash) { should == '243339b48f4e8741' }
  its(:name) { should == 'somemovie' }
  
  describe '#sub_path' do
    it 'should only change the extension of the movie' do
        movie_file = Opensubtitles::MovieFile.new('directory-with-extension.avi/movie-file.avi', false)
        movie_file.sub_path('srt').should == 'directory-with-extension.avi/movie-file.srt'
    end
  end
end
