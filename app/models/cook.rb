class Cook < ActiveRecord::Base
	has_one :user
	has_and_belongs_to_many :availables
	has_and_belongs_to_many :locations
	has_and_belongs_to_many :languages
	has_many :skills
	has_many :dish_types, through: :skills
	accepts_nested_attributes_for :user
	ratyrate_rateable "skills", "availables"
	mount_uploader :photo, PhotoUploader
end
