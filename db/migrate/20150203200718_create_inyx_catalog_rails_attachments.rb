class CreateInyxCatalogRailsAttachments < ActiveRecord::Migration
  def change
    create_table :inyx_catalog_rails_attachments do |t|
      t.string :name
      t.string :upload
      t.text :description
      t.string :image
      t.text :url
      t.text :target
      t.belongs_to :catalog
      t.boolean :public
      t.string :permalink

      t.timestamps
    end
  end
end
