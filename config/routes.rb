InyxCatalogueRails::Engine.routes.draw do 

	scope :admin do		
  		resources :catalogues do
  			collection do
  				#angular
		  		get 'all_products', to: 'catalogues#all_products' 
          post '/delete', to: 'catalogues#delete'
  			end
  		end
  		resources :category_catalogues do
  			collection do
  				#angular
		  		get 'all_category/', to: 'category_catalogues#all_category'
		  		get 'one_category/:id', to: 'category_catalogues#one_category'
  			end
  		end  		
		
  	end

    get 'catalogues/', to: 'catalogues#index_front' if InyxCatalogueRails::active_index 	
    get 'catalogues/:id', to: 'catalogues#show_front' if InyxCatalogueRails::active_show
end

