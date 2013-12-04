class CreateRectangles < ActiveRecord::Migration
  def change
    create_table :rectangles do |t|
      t.float :x
      t.float :y
      t.float :width
      t.float :height
      t.references :layer
      

      t.timestamps
    end
  end
end
