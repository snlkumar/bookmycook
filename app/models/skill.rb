class Skill < ActiveRecord::Base
	belongs_to :dish_type
	belongs_to :cook
end
