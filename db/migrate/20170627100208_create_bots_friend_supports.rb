class CreateBotsFriendSupports < ActiveRecord::Migration
  def change
    create_table :bots_friend_supports do |t|
      t.belongs_to :bot, index: true, foreign_key: true
      t.belongs_to :friend_support, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
