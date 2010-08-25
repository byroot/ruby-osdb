require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::Server do
  
  subject do
    OSDb::Movie.new(File.dirname(__FILE__) + '/../fixtures/somemovie.avi')
  end
  
  its(:hash) { should == '243339b48f4e8741' }
  
end