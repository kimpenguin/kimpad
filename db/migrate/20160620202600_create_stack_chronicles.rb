class CreateStackChronicles < ActiveRecord::Migration
  def change
    create_table :stack_chronicles do |t|
      t.integer :stack_id
      t.integer :chronicle_id

      t.timestamps null: false
    end
  end
end
