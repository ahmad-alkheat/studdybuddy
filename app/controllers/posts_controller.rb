class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:welcome]
	
	def welcome
		@disable_logout = true
	end

	def index
		@posts=Post.all.order('id DESC')
	end

	def new 
		@post=Post.new
	end

	def create
		@post = current_user.posts.build(post_params)
		@post.save
		redirect_to root_path
	end

	def show
		@post=Post.find(params[:id])
	end

	def edit
		@post=Post.find(params[:id])
		unless authorized_user
			raise "error"
		end
	end

	def update
		@post=Post.find(params[:id])
		unless !authorized_user
			@post.update(post_params)
		end
		redirect_to root_path
	end

	def destroy
		@post=Post.find(params[:id])
		unless !authorized_user
			@post.destroy
		end
		redirect_to root_path
	end

	def profile
	end



	private

	def post_params
		params.require(:post).permit(:course_name, :course_number, :submitted_by)
	end

	def authorized_user
		current_user== @post.user
	end
end
