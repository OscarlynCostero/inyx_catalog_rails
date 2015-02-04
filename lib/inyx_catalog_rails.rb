require "inyx_catalog_rails/engine"

module InyxCatalogRails
  SITEBAR = {'catalogs' => '/catalogs'}
  # Default way to setup ContactUs. Run rake contact_us:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
