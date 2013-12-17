class CreateLayers < ActiveRecord::Migration
  def change
    create_table :layers do |t|
      t.string :fill, default: "none"
      t.string :stroke, default: "black"
      t.string :opacity, default: "1"
      t.references :canvas

      t.timestamps
    end
  end
end
