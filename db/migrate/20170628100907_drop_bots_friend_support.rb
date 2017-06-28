class DropBotsFriendSupport < ActiveRecord::Migration
  def up
    drop_table :bots_friend_supports
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
