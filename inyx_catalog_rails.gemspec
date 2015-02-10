$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "inyx_catalog_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "inyx_catalog_rails"
  s.version     = InyxCatalogRails::VERSION
  s.authors     = ["TODO: Your name"]
  s.email       = ["TODO: Your email"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of InyxCatalogRails."
  s.description = "TODO: Description of InyxCatalogRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.4"
  s.add_dependency "simple_form"  
  s.add_dependency "haml_rails"
  s.add_dependency "carrierwave"
  s.add_dependency "soundcloud"
  s.add_development_dependency "sqlite3"
end