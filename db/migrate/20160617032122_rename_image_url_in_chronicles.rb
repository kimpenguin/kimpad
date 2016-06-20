class RenameImageUrlInChronicles < ActiveRecord::Migration
  def change
  	rename_column :chronicles, :image_url, :image
  end
end
