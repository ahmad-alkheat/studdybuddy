class User < ActiveRecord::Base

  validates :name, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@queensu\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX, message: "Not a valid Queen's Email"}, unless: -> { from_omniauth? }
  has_attached_file :avatar,
  :styles => { medium: "300x300>", thumb: "160x160>" },
  :storage => :s3,
  :bucket => 'photosstuddybuddy'

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
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :confirmable, :omniauth_providers => [:facebook]

  def from_omniauth?
    provider && uid
  end

end
