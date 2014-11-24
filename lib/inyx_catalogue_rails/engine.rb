module InyxCatalogueRails
  class Engine < ::Rails::Engine
    config.autoload_paths << File.expand_path("../lib/some/path", __FILE__)
    isolate_namespace InyxCatalogueRails
  end
end
