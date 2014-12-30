class User < ActiveRecord::Base
	has_many :posts,  dependent: :destroy

	def self.from_omniauth(auth)
    	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    		user.email = auth.info.email
    		user.password = Devise.friendly_token[0,20]
    		user.name = auth.info.name 
        user.image_string = auth.info.image 
  		end
	end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook]
end
