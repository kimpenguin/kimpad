class AddColumnUrlToChronicle < ActiveRecord::Migration
  def change
    add_column :chronicles, :chronicle_url, :text
  end
end
