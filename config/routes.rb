InyxCatalogRails::Engine.routes.draw do

	get '/catalogos', to: 'catalogs#catalog_index'
	get '/catalogos/:catalog_id/archivos', to: 'attachments#attachment_index'
	get '/catalogos/:catalog_id/archivos/:id', to: 'attachments#attachment_show'

  scope :admin do
	  resources :catalogs do
			resources :attachments do
				collection do
			  		post '/delete', to: 'attachments#delete'
			  	end
			end
			collection do
		  		post '/delete', to: 'catalogs#delete'
		  	end
		end
	end

end
