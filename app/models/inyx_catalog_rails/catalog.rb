require 'elasticsearch/model'
module InyxCatalogRails
  class Catalog < ActiveRecord::Base		
  	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks
  	has_many :attachments, :dependent => :destroy
    mount_uploader :cover, CoverUploader

  	def as_json(options = {})
      {
        id: self.id,
        name: self.name,
        description: self.description,
        cover: self.cover.url,
        category: self.category,
        public_this: self.public ? "Publicado" : "No publicado",
        created_at: self.created_at.strftime("%d-%m-%Y"),        
        count_attachments: Attachment.where(catalog_id: self.id).count
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

    def self.multiple_destroy(ids, current_user)
      ids.each do |id|
        if !current_user.has_role? :admin
          raise CanCan::AccessDenied.new("Access Denied", :delete, InyxCatalogRails::Catalog)
        end
      end
      Catalog.destroy ids
    end

    def self.query(query)
	    { query: { multi_match:  { query: query, fields: [:name, :description, :category, :public_this, :created_at] , operator: :and }  }, sort: { id: "desc" }, size: Catalog.count }
	  end
    
  end
  Catalog.import
end
