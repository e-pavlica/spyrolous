class JoinArtistsToCanvases < ActiveRecord::Migration
  def change
    create_table :artists_canvases do |t|
      t.belongs_to :artist
      t.belongs_to :canvas
    end
  end
end
