require "inyx_catalogue_rails/engine"

module InyxCatalogueRails
	#link y nombre para el sitebar automatico en administración
  SITEBAR = { 'catalogues'=> "/catalogues" }

  # true/false si desea que se autentiquen los usuarios para poder usar el modulo en el frontend
  mattr_accessor :authenticate
  #activar front index
  mattr_accessor :active_index
  #activar front show
  mattr_accessor :active_show

  # Default way to setup ContactUs. Run rake contact_us:install to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end
end
