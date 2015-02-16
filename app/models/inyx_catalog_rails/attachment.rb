module InyxCatalogRails
  class Attachment < ActiveRecord::Base
  	belongs_to :catalog
  	include Elasticsearch::Model
  	include Elasticsearch::Model::Callbacks
    mount_uploader :image, CoverUploader
    after_update :remove_image
    validates_presence_of :name
    before_save :url_iframe_service

  	def as_json(options = {})
      {
        id: self.id,
        name: self.name,
        upload: self.upload,
        description: self.description,
        image: self.image.url,
        url: self.url,
        target: self.target,
        public_this: self.public ? "Publicado" : "No publicado",
        created_at: self.created_at.strftime("%d-%m-%Y"),
        catalog_id: self.catalog_id
      }
    end

    def remove_image
      if !self.image_url.nil? and self.upload != "1"
        image = File.dirname(Rails.root.join("public"+self.image_url))
        FileUtils.rm_rf(image)
      end
    end

      #params[:search] is false
  	def self.index(current_user, catalog_id)
  		Attachment.where(catalog_id: catalog_id).order("created_at DESC")
  	end

  	#params[:search] is true
  	def self.index_search(objects, current_user, catalog_id)
  		objects.order("created_at DESC")
  	end

  	#params[:search] is true
  	def self.index_total(objects, current_user, catalog_id)
  		objects.count
  	end

    def self.multiple_destroy(ids, current_user)
      ids.each do |id|
        if !current_user.has_role? :admin
          raise CanCan::AccessDenied.new("Access Denied", :delete, InyxCatalogRails::Attachment)
        end
      end
      Attachment.destroy ids
    end

    def self.query(query)
	    { query: { multi_match:  { query: query, fields: [:name, :type, :description, :public_this, :created_at] , operator: :and }  }, sort: { id: "desc" }, size: Attachment.count }
	  end

    def url_iframe_service
      if !self.url.blank?
        video = self.detected_video_service
        begin
          case video.keys.first
            when "youtube"
              self.url="https://www.youtube.com/embed/"+video.values.first
            when "vimeo"
              self.url="https://player.vimeo.com/video/"+video.values.first
            when "soundcloud"
              detected_soundcloud_sets              
            when "imagen"
            else
              self.url=""
            end
        rescue
          self.url=""
        end
      end
    end

    def detected_soundcloud_sets
      client = Soundcloud.new(:client_id => 'YOUR_CLIENT_ID')
      begin
        track = client.get('/resolve', :url => self.url)
        if self.url.split(/\W+/).include?("sets")
          self.url="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/playlists/#{track.id}&amp;color=ff5500&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false"
        else
          self.url="https://w.soundcloud.com/player/?url=https%3A//api.soundcloud.com/tracks/#{track.id}&amp;auto_play=false&amp;hide_related=false&amp;show_comments=true&amp;show_user=true&amp;show_reposts=false&amp;visual=true"
        end 
      rescue Soundcloud::ResponseError => e
        
      end
    end

    def detected_video_service
      ["youtube", "vimeo", "soundcloud"].each do |service|     
        return { service=>self.url.split(/\W+/).last } if self.url.split(/\W+/).include?(service)
      end
      if self.upload == "2"
        {"imagen"=>""}
      end
    end
    
  end
  Attachment.import
end
