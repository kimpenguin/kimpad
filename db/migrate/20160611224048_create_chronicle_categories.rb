class CreateChronicleCategories < ActiveRecord::Migration
  def change
    create_table :chronicle_categories do |t|
      t.integer :chronicle_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
