class Post < ActiveRecord::Base
	belongs_to :user
	delegate :id, :name, :email, :image_string, :to => :user, :prefix => true

	
end
