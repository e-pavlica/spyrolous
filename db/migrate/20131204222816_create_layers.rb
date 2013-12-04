class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :fill
      t.string :stroke
      t.string :opacity
      t.references :canvas

      t.timestamps
    end
  end
end
