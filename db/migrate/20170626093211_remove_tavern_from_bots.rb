class RemoveTavernFromBots < ActiveRecord::Migration
  def change
    remove_column :bots, :tavern_x, :integer
    remove_column :bots, :tavern_y, :integer
  end
end
