class CreateStackCategories < ActiveRecord::Migration
  def change
    create_table :stack_categories do |t|
      t.integer :stack_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
