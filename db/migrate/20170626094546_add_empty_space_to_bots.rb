class AddEmptySpaceToBots < ActiveRecord::Migration
  def change
    add_column :bots, :empty_x, :integer
    add_column :bots, :empty_y, :integer
  end
end
