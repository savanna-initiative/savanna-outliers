#!/usr/bin/env rake
require 'bundler'

task :default => [:test]

task :test do
  sh("bundle exec rspec spec/")
end

# Setup the necessary gems, specified in the gemspec.
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
