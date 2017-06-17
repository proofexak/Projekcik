class BuildingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bot = current_user.bots.find(params[:bot_id])
    @buildings = @bot.buildings
  end

  def new
    @bot = current_user.bots.find(params[:bot_id])
    @building = @bot.buildings.new
  end

  def create
    @bot = current_user.bots.find(params[:bot_id])
    @building = @bot.buildings.new(building_params)

    if @building.save
      redirect_to bot_buildings_path, notice: 'Building was successfully created.'
    else
      render :new
    end
  end

  def update
    @bot = current_user.bots.find(params[:bot_id])
    @building = @bot.buildings.find(params[:id])

    if @building.update(building_params)
      redirect_to bot_buildings_path, notice: 'Building was successfully updated.'
    else
      render :edit
    end
  end

  def edit
    @bot = current_user.bots.find(params[:bot_id])
    @building = @bot.buildings.find(params[:id])
  end

  def destroy
    @bot = current_user.bots.find(params[:bot_id])
    @building = @bot.buildings.find(params[:id])
    @building.destroy

    redirect_to bot_buildings_path, notice: 'Building was successfully destroyed'
  end

  def show
    @bot = current_user.bots.find(params[:bot_id])
    @building = @bot.buildings.find(params[:id])
  end

  private

  def building_params
    params.require(:building).permit(:name, :type, :coordinate_x, :coordinate_y)
  end

end
