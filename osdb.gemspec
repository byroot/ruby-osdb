# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "osdb/version"

Gem::Specification.new do |s|
  s.name        = "osdb"
  s.version     = OSDb::VERSION
  s.authors     = ["Jean Boussier"]
  s.email       = ["jean.boussier @nospam@ gmail.com"]
  s.homepage    = %q{http://github.com/byroot/ruby-osdb}
  s.summary     = %q{Ruby library to access OSDb services like OpenSubtitles.org}

  s.rubyforge_project = "osdb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.license       = 'MIT'
end
