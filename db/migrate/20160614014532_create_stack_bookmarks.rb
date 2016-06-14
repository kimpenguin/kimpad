class CreateStackBookmarks < ActiveRecord::Migration
  def change
    create_table :stack_bookmarks do |t|
      t.integer :stack_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
