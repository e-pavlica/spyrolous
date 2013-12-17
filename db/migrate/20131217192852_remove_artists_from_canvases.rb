class RemoveArtistsFromCanvases < ActiveRecord::Migration
  def change
    remove_column :canvases, :artists_id
  end
end
