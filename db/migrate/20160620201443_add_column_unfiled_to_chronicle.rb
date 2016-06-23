class AddColumnUnfiledToChronicle < ActiveRecord::Migration
  def change
  	add_column :chronicles, :unfiled, :boolean
  end
end
