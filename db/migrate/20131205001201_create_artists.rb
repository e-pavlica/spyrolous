class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :google_id

      t.timestamps
    end
  end
end