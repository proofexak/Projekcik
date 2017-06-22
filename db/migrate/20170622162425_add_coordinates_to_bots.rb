class AddCoordinatesToBots < ActiveRecord::Migration
  def change
    add_column :bots, :tavern_x, :integer
    add_column :bots, :tavern_y, :integer
    add_column :bots, :next_x, :integer
    add_column :bots, :next_y, :integer
  end
end
