class RenameColumnChronicleUrlInChronicles < ActiveRecord::Migration
  def change
  	rename_column :chronicles, :chronicle_url, :reference_url
  end
end
