# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{osdb}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jean Boussier"]
  s.cert_chain = ["/Users/byroot/.ssh/gem-public_cert.pem"]
  s.date = %q{2010-09-29}
  s.default_executable = %q{getsub}
  s.description = %q{Ruby library to access OSDb services like OpenSubtitles.org}
  s.email = %q{jean.boussier @nospam@ gmail.com}
  s.executables = ["getsub"]
  s.extra_rdoc_files = ["bin/getsub", "lib/osdb.rb", "lib/osdb/language.rb", "lib/osdb/movie.rb", "lib/osdb/server.rb", "lib/osdb/sub.rb"]
  s.files = ["Manifest", "Rakefile", "bin/getsub", "lib/osdb.rb", "lib/osdb/language.rb", "lib/osdb/movie.rb", "lib/osdb/server.rb", "lib/osdb/sub.rb", "osdb.gemspec", "spec/fixtures/somemovie.avi", "spec/osdb/language_spec.rb", "spec/osdb/movie_spec.rb", "spec/osdb/server_spec.rb", "spec/osdb/sub_spec.rb", "spec/spec_helper.rb"]
  s.homepage = %q{http://github.com/byroot/ruby-osdb}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Osdb"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{osdb}
  s.rubygems_version = %q{1.3.7}
  s.signing_key = %q{/Users/byroot/.ssh/gem-private_key.pem}
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
