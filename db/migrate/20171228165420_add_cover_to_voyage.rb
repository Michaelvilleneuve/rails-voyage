class AddCoverToVoyage < ActiveRecord::Migration[5.1]
  def change
    remove_column :voyages, :cover
    add_attachment :voyages, :cover
  end
end
