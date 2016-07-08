module ApplicationHelper
	def availables
		Available.all
	end

	def locations
		Location.all
	end

	def dish_types
		DishType.all
	end

	def languages
		Language.all
	end

	def locations_hash
		locations.map{ |l| {"#{l.id}" => l.name}}.reduce({}, :merge)
	end
end
