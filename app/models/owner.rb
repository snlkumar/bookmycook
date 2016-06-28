class Owner < ActiveRecord::Base
	has_one :user
	has_and_belongs_to_many :availables
	accepts_nested_attributes_for :user
	ratyrate_rater	
end
