require File.dirname(__FILE__) + '/../lib/osdb'
require 'spec/autorun'

# Spec Helpers
Dir[File.dirname(__FILE__) + '/*_spec_helper.rb'].each do |f|
  require File.expand_path(f)
end
