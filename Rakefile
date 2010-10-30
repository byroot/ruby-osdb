require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

begin
  require 'echoe'
  
  Echoe.new('osdb', '0.0.4') do |p|
    p.description    = "Ruby library to access OSDb services like OpenSubtitles.org"
    p.url            = "http://github.com/byroot/ruby-osdb"
    p.author         = "Jean Boussier"
    p.email          = "jean.boussier @nospam@ gmail.com"
  end
  
rescue LoadError => e
  puts "Failed to load Echoe"
  puts e.message
end

task :default => :spec