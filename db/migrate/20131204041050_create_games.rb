class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :data
      t.integer :user

      t.timestamps
    end
  end
end
