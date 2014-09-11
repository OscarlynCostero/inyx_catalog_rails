$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "inyx_catalogue_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "inyx_catalogue_rails"
  s.version     = InyxCatalogueRails::VERSION
  s.authors     = ["Inyxtech"]
  s.email       = ["inyxtech@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ContactUs."
  s.description = "TODO: Description of ContactUs."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"

  s.add_development_dependency "sqlite3"
end
