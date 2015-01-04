class UsersController < ApplicationController

	def show
  		@user = User.find(params[:id])
	end

	def send_email
		@user = User.find(params[:id])
		UserMailer.welcome_email(@user, current_user).deliver
	end


end
