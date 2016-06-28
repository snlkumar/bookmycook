class DishType < ActiveRecord::Base
	has_many :skills
	has_many :cooks, through: :skills
end
