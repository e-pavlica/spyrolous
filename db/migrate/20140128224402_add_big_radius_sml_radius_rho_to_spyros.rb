class AddBigRadiusSmlRadiusRhoToSpyros < ActiveRecord::Migration
  def change
    add_column :spyros, :big_radius, :float
    add_column :spyros, :small_radius, :float
    add_column :spyros, :rho, :float
    add_column :spyros, :x, :float
    add_column :spyros, :y, :float
  end
end
