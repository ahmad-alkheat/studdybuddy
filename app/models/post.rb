class Post < ActiveRecord::Base
	searchkick
	belongs_to :user
	delegate :id, :name, :email, :image_string, :avatar, :to => :user, :prefix => true

	
end
