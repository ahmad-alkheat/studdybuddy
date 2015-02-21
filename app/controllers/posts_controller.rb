class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:welcome]
	respond_to :html, :js

	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 10).order('id DESC')
	end

	def new
		@post = Post.new
	end

	def create
		@post = current_user.posts.create(post_params)
	end

	def edit
		@post = Post.find(params[:id])
		unless authorized_user
			raise "error"
		end
	end

	def update
		@post = Post.find(params[:id])
		unless !authorized_user
			@post.update(post_params)
		end
	end

	def destroy
		@post = Post.find(params[:id])
		unless !authorized_user
			@post.destroy
		end
	end

	def search
		@posts = Post.search(params[:search])
	end

	def welcome
		@disable_logout = true
	end


	private

	def post_params
		params.require(:post).permit(:course_name, :course_number)
	end

	def authorized_user
		current_user == @post.user
	end
end
