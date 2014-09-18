module InyxCatalogueRails
  class CategoryCatalogue < ActiveRecord::Base
  	has_many :catalogues
  end
end
