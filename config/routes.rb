InyxCatalogueRails::Engine.routes.draw do 

	scope :admin do		
  		resources :catalogues do
  			collection do
  				#angular
		  		get 'all_products', to: 'catalogues#all_products'
          post '/delete', to: 'catalogues#destroy'
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
  	
end

