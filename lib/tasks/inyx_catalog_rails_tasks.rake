#RawBlameHistory  
# desc "Explaining what the task does"
# task :inyx_contact_us_rails do
#   # Task goes here
# end
require File.expand_path('../../inyx_catalog_rails/tasks/install', __FILE__)

namespace :catalog do
	desc "Copiar inicializador para la configuración"
	task :copy_initializer do
		InyxCatalogRails::Tasks::Install.copy_initializer_file
	end

  desc "Copiar vistas al proyecto"
  task :copy_views do
    InyxCatalogRails::Tasks::Install.copy_view_files
  end
end
