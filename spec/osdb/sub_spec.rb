require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::Sub do
  
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
    OSDb::Sub.new @response
  end
  
  its(:format) { should == 'srt' }
  
  its(:url) { should be_an(URI::HTTP) }
  
  its(:language) { should be_a(OSDb::Language) }
  
  its(:rating) { should == 7.89 }
  
  its(:movie_name) { should == 'Lock, Stock and Two Smoking Barrels' }
  
  it 'should be comparable' do
    [subject, OSDb::Sub.new(@response.merge('SubRating' => '2.45'))].max.should == subject
  end
  
end
