InyxCatalogRails::Engine.routes.draw do

	get '/catalogs/index', to: 'catalogs#catalog_index'
	get '/catalogs/attachments/index/:catalog_id', to: 'attachments#attachment_index'

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
