class CreateChronicleBookmarks < ActiveRecord::Migration
  def change
    create_table :chronicle_bookmarks do |t|
      t.integer :chronicle_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
