class CreateSpyros < ActiveRecord::Migration
  def change
    create_table :spyros do |t|
      t.text :path
      t.string :fill
      t.string :stroke
      t.references :layer

      t.timestamps
    end
  end
end
