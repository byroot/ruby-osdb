require File.dirname(__FILE__) + '/../lib/osdb'
require 'rspec'
require 'rspec/its'

require 'webmock/rspec'
require 'vcr'

RSpec.configure do |c|
  c.mock_with :rspec
end

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/http'
  c.hook_into :webmock
end
