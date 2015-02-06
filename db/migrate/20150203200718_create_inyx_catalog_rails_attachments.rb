class CreateInyxCatalogRailsAttachments < ActiveRecord::Migration
  def change
    create_table :inyx_catalog_rails_attachments do |t|
      t.string :name
      t.string :upload
      t.text :description
      t.string :image
      t.text :url
      t.belongs_to :catalog
      t.boolean :public

      t.timestamps
    end
  end
end
