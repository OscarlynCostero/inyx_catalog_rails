require 'elasticsearch/model'
module InyxCatalogRails
  class Catalog < ActiveRecord::Base		
	include Elasticsearch::Model
	include Elasticsearch::Model::Callbacks
  	has_many :attachments

  	def as_json(options = {})
      {
        id: self.id,
        name: self.name,
        description: self.description,
        cover: self.cover,
        category: self.category,
        public_this: self.public,
        created_at: self.created_at
      }
    end

    #params[:search] is false
	def self.index(current_user)
		Catalog.order("created_at DESC")
	end

	#params[:search] is true
	def self.index_search(objects, current_user)
		objects.order("created_at DESC")
	end

	#params[:search] is true
	def self.index_total(objects, current_user)
		objects.count
	end

    def self.query(query)
	    { query: { multi_match:  { query: query, fields: [:name, :description, :category, :public,:created_at] , operator: :and }  }, sort: { id: "desc" }, size: User.count }
	  end
  end

  Catalog.import
end
