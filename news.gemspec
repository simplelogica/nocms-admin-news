$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "no_cms/admin/news/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "no_cms-admin-news"
  s.version     = NoCms::Admin::News::VERSION
  s.authors     = ["Simplelogica"]
  s.email       = ["gems@simplelogica.net"]
  s.homepage    = "https://github.com/simplelogica/nocms-admin-news"
  s.summary     = "Gem with custom back for nocms-news gem"
  s.description = "Gem with custom back for nocms-news gem"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.add_dependency "rails", "~> 4.0", ">= 4.0.4"
  s.add_dependency "nocms-admin", '~> 0.0', '>= 0.0.1'
  s.add_dependency "nocms-news", '~> 0.0', '>= 0.0.1'

  s.add_development_dependency "sqlite3"
end
