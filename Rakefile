require 'rubygems'
require 'rake'

# TODO: update rspec to 2.X
# require 'spec/rake/spectask'
# 
# Spec::Rake::SpecTask.new(:spec) do |spec|
#   spec.libs << 'lib' << 'spec'
#   spec.spec_files = FileList['spec/**/*_spec.rb']
# end


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "osdb"
    gem.summary = %Q{Ruby library to access OSDb services like OpenSubtitles.org}
    gem.email = "jean.boussier @nospam@ gmail.com"
    gem.homepage = "http://github.com/byroot/ruby-osdb"
    gem.authors = ["Jean Boussier"]
    gem.add_development_dependency "rspec", "~> 1.3"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install   jeweler"
end

task :default => :spec