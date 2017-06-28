module ConfigurationsHelper

	def which_config(bot, config)
		if bot.type == 'support'
			friend_config_bot_configuration_path(bot, config)
		elsif bot.type == 'production'
			production_config_bot_configuration_path(bot, config)
		end
	end

end
