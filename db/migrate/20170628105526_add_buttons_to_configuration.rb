class AddButtonsToConfiguration < ActiveRecord::Migration
  def change
    add_column :configurations, :fivemin_y, :integer
    add_column :configurations, :fivemin_x, :integer
    add_column :configurations, :next_x, :integer
    add_column :configurations, :next_y, :integer
    add_column :configurations, :empty_x, :integer
    add_column :configurations, :empty_y, :integer
    add_column :configurations, :close_x, :integer
    add_column :configurations, :close_y, :integer
    add_column :configurations, :neighbor_x, :integer
    add_column :configurations, :neighbor_y, :integer
  end
end
