module InyxCatalogueRails
  class Catalogue < ActiveRecord::Base  	
  	belongs_to :category_catalogue
  	validates_presence_of :title, :category_catalogue_id
  	validates_numericality_of :prince
  	def self.add
  		50.times do |i|
  			Catalogue.create title: "Producto #{i}", description:"Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates similique porro, quia deleniti quae iure laboriosam maxime eum sequi quaerat ex. Quidem quam officia, numquam tenetur est nisi mollitia ipsam.Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laudantium sed ducimus deserunt molestiae alias voluptates neque aliquam animi magnam sapiente, aliquid ab, eius dolorum vel voluptatem, quaerat temporibus explicabo pariatur.",  prince: "35000",  category_catalogue_id: Random.rand(1..2)
  		end
  	end
  end
end
