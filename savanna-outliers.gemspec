require File.expand_path('../lib/savanna-outliers/version', __FILE__)
require 'date'

Gem::Specification.new do |gem|
  gem.name = 'savanna-outliers'
  gem.version = Savanna::Outliers::VERSION
  gem.date = Date.today.to_s
  gem.license = 'MIT'
  gem.summary = %Q{Savanna outliers: Plug & Play Anomaly Detection}
  gem.description = %Q{Read more documentation at repository homepage.}
  gem.authors = ['Max Makarochkin']
  gem.email = 'maxim.makarochkin@gmail.com'
  gem.homepage = 'https://github.com/savanna-initiative/savanna-outliers'
  gem.require_path = 'lib'
  gem.files = Dir.glob("{lib,spec}/**/*")
  gem.required_ruby_version = '>= 1.9.3'
  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_dependency 'descriptive_statistics'
  gem.add_dependency 'statistics3'
end
