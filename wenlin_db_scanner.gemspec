# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "wenlin_db_scanner"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Victor Costan"]
  s.date = "2012-09-30"
  s.description = "The Wenlin dictionary contains two great databases, the ABC English<->Chinese\ndictionary, and the Character Description Language (CDL). Unfortunately, this\ndata is wrapped by a less-than-great UI. This gem lets you extract the data so\nyou can build your own UI for it.\n"
  s.email = "victor@costan.us"
  s.executables = ["wenlin_dbdump", "wenlin_dict", "wenlin_hanzi", "wenlin_parts"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "bin/wenlin_dbdump",
    "bin/wenlin_dict",
    "bin/wenlin_hanzi",
    "bin/wenlin_parts",
    "lib/wenlin_db_scanner.rb",
    "lib/wenlin_db_scanner/chars.rb",
    "lib/wenlin_db_scanner/db.rb",
    "lib/wenlin_db_scanner/db_record.rb",
    "lib/wenlin_db_scanner/dict.rb",
    "lib/wenlin_db_scanner/speech_parts.rb",
    "reversed/README.md",
    "reversed/code.asm",
    "reversed/magic.txt",
    "reversed/notes.txt"
  ]
  s.homepage = "http://github.com/pwnall/wenlin_db_scanner"
  s.licenses = ["CC0"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.24"
  s.summary = "Extracts the data from the Wenlin dictionary"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<yard>, [">= 0.8.2.1"])
      s.add_development_dependency(%q<rdoc>, [">= 3.12"])
      s.add_development_dependency(%q<bundler>, [">= 1.2.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.8.4"])
    else
      s.add_dependency(%q<yard>, [">= 0.8.2.1"])
      s.add_dependency(%q<rdoc>, [">= 3.12"])
      s.add_dependency(%q<bundler>, [">= 1.2.0"])
      s.add_dependency(%q<jeweler>, [">= 1.8.4"])
    end
  else
    s.add_dependency(%q<yard>, [">= 0.8.2.1"])
    s.add_dependency(%q<rdoc>, [">= 3.12"])
    s.add_dependency(%q<bundler>, [">= 1.2.0"])
    s.add_dependency(%q<jeweler>, [">= 1.8.4"])
  end
end

