class JoinArtistsToCanvases < ActiveRecord::Migration
  def change
    create_table :artists_canvases do |t|
      t.belongs_to :artists
      t.belongs_to :canvases
    end
  end
end
