InyxCatalogueRails::Engine.routes.draw do
	scope :admin do		
  		resources :catalogues 
  	end
  	
end

