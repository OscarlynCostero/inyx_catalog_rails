require File.expand_path('../../inyx_catalogue_rails/tasks/install', __FILE__)

namespace :catalogue do
	desc "Copiar inicializador para la configuración"
	task :copy_initializer do
		InyxCatalogueRails::Tasks::Install.copy_initializer_file
	end

  desc "Copiar vistas al proyecto"
  task :copy_views do
    InyxCatalogueRails::Tasks::Install.copy_view_files
  end
end