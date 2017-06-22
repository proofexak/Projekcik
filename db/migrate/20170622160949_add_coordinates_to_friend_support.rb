class AddCoordinatesToFriendSupport < ActiveRecord::Migration
  def change
    add_column :friend_supports, :tavern_x, :integer
    add_column :friend_supports, :tavern_y, :integer
  end
end
