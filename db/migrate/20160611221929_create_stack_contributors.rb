class CreateStackContributors < ActiveRecord::Migration
  def change
    create_table :stack_contributors do |t|
      t.integer :stack_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
