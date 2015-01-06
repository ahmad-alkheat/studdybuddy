class UsersController < ApplicationController

	def show
  		@user = User.find(params[:id])
	end

	def email_form
	end

	def send_email
		@user = User.find(params[:id])
		email = params[:send_email][:your_email]
		content = params[:send_email][:content]
		UserMailer.email(email, @user.email, content).deliver
		flash[:notice] = "Email sent successfully"
		redirect_to root_path

	end 
end
