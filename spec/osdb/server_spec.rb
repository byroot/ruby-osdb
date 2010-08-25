require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe OSDb::Server do
  
  before :all do
    @server = OSDb::Server.new(
      :host => 'api.opensubtitles.org', 
      :path => '/xml-rpc'
    )
  end
  
  subject { @server }
  
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
  
end