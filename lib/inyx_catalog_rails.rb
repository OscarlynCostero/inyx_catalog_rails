require "inyx_catalog_rails/engine"

module InyxCatalogRails
		mattr_accessor :catalog_index

		mattr_accessor :attachment_index

		mattr_accessor :attachment_show	

  SITEBAR = {'catalogs' => '/catalogs'}
  # Default way to setup ContactUs. Run rake contact_us:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
