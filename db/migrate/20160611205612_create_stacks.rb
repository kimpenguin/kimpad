class CreateStacks < ActiveRecord::Migration
  def change
    create_table :stacks do |t|
      t.integer :user_id
      t.string :stack_name
      t.integer :post_count

      t.timestamps null: false
    end
  end
end
