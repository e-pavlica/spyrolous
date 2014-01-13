class MoveAttrsToSvgs < ActiveRecord::Migration
  def change
    add_column :circles, :fill, :string, default: 'none'
    add_column :circles, :stroke, :string, default: 'black'
    add_column :circles, :opacity, :string, default: '1'
    add_column :circles, :stroke_width, :string, default: '1'
    add_column :rectangles, :fill, :string, default: 'none'
    add_column :rectangles, :stroke, :string, default: 'black'
    add_column :rectangles, :opacity, :string, default: '1'
    add_column :rectangles, :stroke_width, :string, default: '1'
    add_column :paths, :fill, :string, default: 'none'
    add_column :paths, :stroke, :string, default: 'black'
    add_column :paths, :opacity, :string, default: '1'
    add_column :paths, :stroke_width, :string, default: '1'
    add_column :spyros, :opacity, :string, default: '1'
    add_column :spyros, :stroke_width, :string, default: '1'
    remove_column :layers, :fill, :string, default: 'none'
    remove_column :layers, :stroke, :string, default: 'black'
    remove_column :layers, :opacity, :string, default: '1'
  end
end
