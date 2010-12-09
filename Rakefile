require 'rubygems'
require 'rake'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

begin
  require 'echoe'
  
  Echoe.new('bartzon-osdb', '0.0.5') do |p|
    p.description    = "Ruby library to access OSDb services like OpenSubtitles.org"
    p.url            = "http://github.com/bartzon/ruby-osdb"
    p.author         = "Jean Boussier, Bart Zonneveld"
    p.email          = "jean.boussier @nospam@ gmail.com, loop@superinfinite.com"
  end
  
rescue LoadError => e
  puts "Failed to load Echoe"
  puts e.message
end

task :default => :spec