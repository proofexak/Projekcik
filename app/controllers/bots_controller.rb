class BotsController < ApplicationController
	before_action :authenticate_user!
	include BotsHelper

	def index
		@bots = current_user.bots
	end

	def new
		@bot = current_user.bots.new
	end

	def create
		@bot = current_user.bots.new(bot_params)

		if @bot.save
			redirect_to new_bot_configuration_path(@bot), notice: 'Bot was successfully created.'
		else
			render :new
		end
	end

	def edit
		@bot = current_user.bots.find(params[:id])
	end

	def update
		@bot = current_user.bots.find(params[:id])

		if @bot.update(bot_params)
			update_redirect(@bot, params[:form])
		else
			render :edit
		end
	end

	def destroy
		@bot = current_user.bots.find(params[:id])
		@bot.destroy

		redirect_to bots_path, notice: 'Bot was successfully destroyed'
	end

	def show
		@bot = current_user.bots.find(params[:id])
	end

	def download
		@bot = current_user.bots.find(params[:id])
		@config = @bot.configuration

		send_data render_to_string('bots/download', layout: false), filename: "#{@bot.name}.ahk"
	end

	def configuration
    @bot = current_user.bots.find(params[:id])
  end

	def update_redirect(bot, form)
		if form
			redirect_to configuration_bot_path(bot), notice: 'Config was successfully updated.'
		else
			redirect_to bots_path, notice: 'Bot was successfully updated.'
		end
	end

	private

  def bot_params
  	params.require(:bot).permit(:name, :type, :next_x, :next_y, :empty_x, :empty_y,
  	 :coordinate_x, :coordinate_y, :close_x, :close_y, :neighbor_x, :neighbor_y)
  end

end
