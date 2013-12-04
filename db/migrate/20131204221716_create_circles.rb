class CreateCircles < ActiveRecord::Migration
  def change
    create_table :circles do |t|
      t.float :x
      t.float :y
      t.float :radius
      t.references :layer

      t.timestamps
    end
  end
end
