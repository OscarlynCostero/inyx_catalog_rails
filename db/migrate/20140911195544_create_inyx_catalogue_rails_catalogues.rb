class CreateInyxCatalogueRailsCatalogues < ActiveRecord::Migration
  def change
    create_table :inyx_catalogue_rails_catalogues do |t|
      t.string :image
      t.string :title
      t.text :description
      t.string :prince
      t.boolean :public
      t.integer :category_catalogue_id

      t.timestamps
    end
  end
end
