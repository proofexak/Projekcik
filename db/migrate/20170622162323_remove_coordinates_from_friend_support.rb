class RemoveCoordinatesFromFriendSupport < ActiveRecord::Migration
  def change
    remove_column :friend_supports, :tavern_x, :integer
    remove_column :friend_supports, :tavern_y, :integer
    remove_column :friend_supports, :next_x, :integer
    remove_column :friend_supports, :next_y, :integer
  end
end
