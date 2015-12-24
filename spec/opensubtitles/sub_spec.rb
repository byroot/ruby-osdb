require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Opensubtitles::Sub do
  
  before :each do
    @response = {
      'SubFormat' => 'srt',
      'SubDownloadLink' => 'http://example.com/foo.srt.gz',
      'SubRating' => '7.89',
      'SubLanguageID' => 'dut',
      'MovieName' => 'Lock, Stock and Two Smoking Barrels'
    }
  end
  
  subject do
    Opensubtitles::Sub.new @response
  end
  
  its(:format) { should == 'srt' }
  
  its(:url) { should be_an(URI::HTTP) }
  
  its(:language) { should be_a(Opensubtitles::Language) }
  
  its(:rating) { should == 7.89 }
  
  its(:movie_name) { should == 'Lock, Stock and Two Smoking Barrels' }
  
  it 'should be comparable' do
    [subject, Opensubtitles::Sub.new(@response.merge('SubRating' => '2.45'))].max.should == subject
  end
  
end
