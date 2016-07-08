class Owner < ActiveRecord::Base
	has_one :user
	has_and_belongs_to_many :availables
	has_and_belongs_to_many :dish_types
	accepts_nested_attributes_for :user
	ratyrate_rater
	mount_uploader :photo, PhotoUploader
	after_create :send_otp

	def send_otp
		Typhoeus.get("http://api.msg91.com/api/sendhttp.php?authkey=116833AGwj2DXk3Jc577aa295&mobiles=#{self.mobile}&message=#{self.user.otp_code}&sender=Bookmy&route=4&country=91")	
	end
end
