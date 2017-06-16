class BotsController < ApplicationController
	before_action :authenticate_user!

	def index
		@bots = current_user.bots
	end

	def new
		@bot = current_user.bots.new
	end

	def create
		@bot = current_user.bots.new(bot_params)
		
		if @bot.save
			redirect_to bots_path, notice: 'Bot was successfully created.'
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
			redirect_to bots_path, notice: 'Bot was successfully updated.'
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
		@bot = current_bots.find(params[:id])
	end

	private

  def bot_params
  	params.require(:bot).permit(:name)
  end

end
