class CreateChronicles < ActiveRecord::Migration
  def change
    create_table :chronicles do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.text :image_url

      t.timestamps null: false
    end
  end
end
