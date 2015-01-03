class User < ActiveRecord::Base

 has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
 validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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
