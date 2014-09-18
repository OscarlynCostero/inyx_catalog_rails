class CreateInyxCatalogueRailsCategoryCatalogues < ActiveRecord::Migration
  def change
    create_table :inyx_catalogue_rails_category_catalogues do |t|
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
