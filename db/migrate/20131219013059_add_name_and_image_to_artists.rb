class AddNameAndImageToArtists < ActiveRecord::Migration
  def change
    add_column :artists, :name, :string
    add_column :artists, :image, :string
  end
end
