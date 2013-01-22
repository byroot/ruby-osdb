require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::MovieFile do
  
  subject do
    OSDb::MovieFile.new(File.dirname(__FILE__) + '/../fixtures/somemovie.avi')
  end
  
  its(:hash) { should == '243339b48f4e8741' }
  its(:name) { should == 'somemovie' }
  
end
