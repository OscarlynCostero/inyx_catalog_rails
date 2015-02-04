module InyxCatalogRails
  class Attachment < ActiveRecord::Base
  	belongs_to :catalog
  end
end
