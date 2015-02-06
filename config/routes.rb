InyxCatalogRails::Engine.routes.draw do

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
