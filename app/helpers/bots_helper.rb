module BotsHelper

	def bot_back_path(bot)
		if params[:form]
			bot_configurations_path(bot)
		else
			bots_path
		end
	end

	# Tak wiem że nie działa update_redirect (bez argumentu form i używając params[:form]
	# też nie)
	def update_redirect(bot, form)
		if form
			redirect_to configuration_bot_path(bot), notice: 'Config was successfully updated.'
		else
			redirect_to bots_path, notice: 'Bot was successfully updated.'
		end
	end

end
