# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "wenlin_db_scanner"
  gem.homepage = "http://github.com/pwnall/wenlin_db_scanner"
  gem.license = "CC0"
  gem.summary = %Q{Extracts the data from the Wenlin dictionary}
  gem.description = <<END
The Wenlin dictionary contains two great databases, the ABC English<->Chinese
dictionary, and the Character Description Language (CDL). Unfortunately, this
data is wrapped by a less-than-great UI. This gem lets you extract the data so
you can build your own UI for it.
END
  gem.email = "victor@costan.us"
  gem.authors = ["Victor Costan"]
  # dependencies defined in Gemfile
end
Jeweler::RubygemsDotOrgTasks.new

task :default => :install

require 'yard'
YARD::Rake::YardocTask.new
