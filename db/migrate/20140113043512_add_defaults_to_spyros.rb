class AddDefaultsToSpyros < ActiveRecord::Migration
  def up
    change_column_default :spyros, :fill, 'none'
    change_column_default :spyros, :stroke, 'black'
  end
  def down
    change_column_default :spyros, :fill, nil
    change_column_default :spyros, :stroke, nil
  end
end
