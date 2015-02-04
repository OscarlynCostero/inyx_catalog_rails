InyxCatalogRails::Engine.routes.draw do

  scope :admin do
	  resources :catalogs do
			resources :attachments
		end
	end

end
