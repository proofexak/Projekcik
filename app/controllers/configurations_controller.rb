class ConfigurationsController < ApplicationController
  before_action :authenticate_user!
  include ConfigurationsHelper

  def index
    
  end

  def friend_config
    @bot = current_user.bots.find(params[:bot_id])
    @config = @bot.configuration
  end

  def production_config
    @bot = current_user.bots.find(params[:bot_id])
    @config = @bot.configuration
  end

  def new
    @bot = current_user.bots.find(params[:bot_id])
    @config = @bot.build_configuration

    if @config.save
      redirect_to bots_path, notice: 'Bot was successfully created.'
    else
      render :new
    end
  end

  def edit
    @bot = current_user.bots.find(params[:bot_id])
    @config = @bot.configuration
  end

  def update
    @bot = current_user.bots.find(params[:bot_id])
    @config = @bot.configuration

    if @config.update(configuration_params)
      redirect_to which_config(@bot, @config), notice: 'Config was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def configuration_params
      params.require(:configuration).permit(:next_x, :next_y, :empty_x, :empty_y,
     :fivemin_x, :fivemin_y, :close_x, :close_y, :neighbor_x, :neighbor_y)
    end
end
