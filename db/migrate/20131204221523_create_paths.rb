class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.text :pathString
      t.references :layer

      t.timestamps
    end
  end
end
