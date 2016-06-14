class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :stack_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
