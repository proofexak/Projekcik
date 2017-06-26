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
		@bot = current_user.bots.find(params[:id])
	end

	def download
		@bot = current_user.bots.find(params[:id])

		send_data render_to_string('bots/download', layout: false), filename: "#{@bot.name}.ahk"
	end

	def configuration
    @bot = current_user.bots.find(params[:id])
  end

  def nextbtn
  	@bot = current_user.bots.find(params[:id])
  end

  def nextbtnupdate
  	@bot = current_user.bots.find(params[:id])

  	if @bot.update(additional_bot_params)
  		redirect_to configuration_bot_path, notice: 'Next button was successfully updated.'
  	else
  		render :nextbtn
  	end
  end

  def fiveminbtn
  	@bot = current_user.bots.find(params[:id])
  end

  def fiveminbtnupdate
  	@bot = current_user.bots.find(params[:id])

  	if @bot.update(additional_bot_params)
  		redirect_to configuration_bot_path, notice: 'Five minutes button was successfully updated.'
  	else
  		render :fiveminbtn
  	end
  end

  def closebtn
  	@bot = current_user.bots.find(params[:id])
  end

  def closebtnupdate
  	@bot = current_user.bots.find(params[:id])

  	if @bot.update(additional_bot_params)
  		redirect_to configuration_bot_path, notice: 'Close button was successfully updated.'
  	else
  		render :closebtn
  	end
  end

  def emptybtn
  	@bot = current_user.bots.find(params[:id])
  end

  def emptybtnupdate
  	@bot = current_user.bots.find(params[:id])

  	if @bot.update(additional_bot_params)
  		redirect_to configuration_bot_path, notice: 'Empty space button was successfully updated.'
  	else
  		render :emptybtn
  	end
  end

  def neighborbtn
  	@bot = current_user.bots.find(params[:id])
  end

  def neighborbtnupdate
  	@bot = current_user.bots.find(params[:id])

  	if @bot.update(additional_bot_params)
  		redirect_to configuration_bot_path, notice: 'Neighbor button was successfully updated.'
  	else
  		render :neighborbtn
  	end
  end

	private

  def bot_params
  	params.require(:bot).permit(:name)
  end

  def additional_bot_params
  	params.require(:bot).permit(:next_x, :next_y, :empty_x, :empty_y,
  	 :coordinate_x, :coordinate_y, :close_x, :close_y, :neighbor_x, :neighbor_y)
  end

end
