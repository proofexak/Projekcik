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
		elsif name == "Development points"
			prob.development_points
		elsif name == "Diamonds"
			prob.diamonds
		end
	end

	def total(prob)
		"#{prob.gold + prob.supply + prob.medals + prob.raws + prob.diamonds + prob.development_points}"
	end

	def percentage(name, prob)
		((which_quantity(name, prob) / total(prob).to_f) * 100).round(2)
	end

	def all_percentage(allprob, alltable)
		
		allprob.each do |prob|
			unless prob.gold.nil?
				alltable["Gold"] += prob.gold
			end
			unless prob.supply.nil?
				alltable["Supply"] += prob.supply
			end
			unless prob.medals.nil?
				alltable["Medals"] += prob.medals
			end
			unless prob.raws.nil?
				alltable["Raw materials"] += prob.raws
			end
			unless prob.development_points.nil?
				alltable["Development points"] += prob.development_points
			end
			unless prob.diamonds.nil?
				alltable["Diamonds"] += prob.diamonds
			end
		end

			alltable["Total"] = alltable["Gold"] + alltable["Supply"] + alltable["Medals"] + alltable["Raw materials"] + alltable["Development points"] + alltable["Diamonds"]
			alltable["Gold"] = ((alltable["Gold"].to_f / alltable["Total"].to_f) * 100).round(2)
			alltable["Supply"] = ((alltable["Supply"].to_f / alltable["Total"].to_f) * 100).round(2)
			alltable["Medals"] = ((alltable["Medals"].to_f / alltable["Total"].to_f) * 100).round(2)
			alltable["Raw materials"] = ((alltable["Raw materials"].to_f / alltable["Total"].to_f) * 100).round(2)
			alltable["Development points"] = ((alltable["Development points"].to_f / alltable["Total"].to_f) * 100).round(2)
			alltable["Diamonds"] = ((alltable["Diamonds"].to_f / alltable["Total"].to_f) * 100).round(2)
	end

end