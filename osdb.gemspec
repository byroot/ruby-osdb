# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{osdb}
  s.version = "0.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jean Boussier, Bart Zonneveld"]
  s.date = %q{2010-12-09}
  s.default_executable = %q{getsub}
  s.description = %q{Ruby library to access OSDb services like OpenSubtitles.org}
  s.email = %q{jean.boussier @nospam@ gmail.com, loop@superinfinite.com}
  s.executables = ["getsub"]
  s.extra_rdoc_files = ["README.md", "bin/getsub", "lib/osdb.rb", "lib/osdb/language.rb", "lib/osdb/movie.rb", "lib/osdb/server.rb", "lib/osdb/sub.rb", "lib/osdb/options.rb"]
  s.files = FileList['lib/**/*.rb', 'bin/*', '[A-Z]*', 'spec/**/*'].to_a
  s.homepage = %q{http://github.com/bartzon/ruby-osdb}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Osdb", "--main", "README.md"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{osdb}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{Ruby library to access OSDb services like OpenSubtitles.org}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
