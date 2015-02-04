class CreateInyxCatalogRailsCatalogs < ActiveRecord::Migration
  def change
    create_table :inyx_catalog_rails_catalogs do |t|
      t.string :name
      t.string :description
      t.string :cover
      t.string :category
      t.boolean :public

      t.timestamps
    end
  end
end
