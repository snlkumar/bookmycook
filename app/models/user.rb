class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  attr_accessor :verification_code
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   validates :auth_token, uniqueness: true
   before_create :generate_authentication_token!
   belongs_to :cook
   belongs_to :owner
   has_one_time_password column_name: :otp, length: 4
  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end

  def verified    
    self.update_attributes(is_verified: true)
  end
  

end
