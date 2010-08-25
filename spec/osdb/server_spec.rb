require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::Server do
  
  subject do
    OSDb::Server.new('api.opensubtitles.org', '/xml-rpc')
  end
  
  it 'should respond to #info' do
    hash_including(
      "seconds" => instance_of(Float),
      "last_update_strings" => instance_of(Hash),
      "website_url"=>"http://www.opensubtitles.org",
      "contact"=>"admin@opensubtitles.org",
      "application"=>"OpenSuber v0.2",
      "xmlrpc_version"=>"0.1",
      "xmlrpc_url"=>"http://api.opensubtitles.net/xml-rpc"
    ).should == subject.info
  end
  
end