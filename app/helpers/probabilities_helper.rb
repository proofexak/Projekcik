module ProbabilitiesHelper

	def which_quantity(name, prob)
		if name == "Gold"
			prob.gold
		elsif name == "Medals"
			prob.medals
		elsif name == "Supply"
			prob.supply
		elsif name == "Raw materials"
			prob.raws
		elsif name == "Develompent points"
			prob.development_points
		elsif name == "Diamonds"
			prob.diamonds
		end
	end

	def total(prob)
		"#{@probability.gold + @probability.supply + @probability.medals + @probability.raws + @probability.diamonds + @probability.development_points}"
	end

end