class CreateInyxCatalogRailsCatalogs < ActiveRecord::Migration
  def change
    create_table :inyx_catalog_rails_catalogs do |t|
      t.string :name
      t.text :description
      t.string :cover
      t.string :category
      t.boolean :public
      t.string :permalink

      t.timestamps
    end
  end
end
