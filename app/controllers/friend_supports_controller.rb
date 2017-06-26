class FriendSupportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bot = current_user.bots.find(params[:bot_id])
    @supports = @bot.friend_supports
  end

  def new
    @bot = current_user.bots.find(params[:bot_id])
    @support = @bot.friend_supports.new
  end

  def create
    @bot = current_user.bots.find(params[:bot_id])
    @support = @bot.friend_supports.new(friend_support_params)
    if @support.save
      redirect_to bot_friend_supports_path, notice: 'Friend was successfully created.'
    else
      render :new
    end
  end

  def update
    @bot = current_user.bots.find(params[:bot_id])
    @support = @bot.friend_supports.find(params[:id])

    if @support.update(friend_support_params)
      redirect_to bot_friend_supports_path, notice: 'Friend was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @bot = current_user.bots.find(params[:bot_id])
    @support = @bot.friend_supports.find(params[:id])
  end

  def destroy
    @bot = current_user.bots.find(params[:bot_id])
    @support = @bot.friend_supports.find(params[:id])
    @support.destroy

    redirect_to bot_friend_supports_path, notice: 'Friend was successfully destroyed.'
  end

  def show
    @bot = current_user.bots.find(params[:bot_id])
    @support = @bot.friend_supports.find(params[:id])
  end
    
  private

    def friend_support_params
      params.require(:friend_support).permit(:coordinate_x, :coordinate_y,
       :tavern_x, :tavern_y)
    end
end
