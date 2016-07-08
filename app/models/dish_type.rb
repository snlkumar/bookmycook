class DishType < ActiveRecord::Base
	has_many :skills
	has_many :cooks, through: :skills
	has_and_belongs_to_many :owners
end
