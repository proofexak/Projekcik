class BotsFriendSupport < ActiveRecord::Base
  belongs_to :bot
  belongs_to :friend_support
end
