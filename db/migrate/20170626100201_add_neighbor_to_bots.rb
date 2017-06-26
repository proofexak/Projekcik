class AddNeighborToBots < ActiveRecord::Migration
  def change
    add_column :bots, :neighbor_x, :integer
    add_column :bots, :neighbor_y, :integer
  end
end
