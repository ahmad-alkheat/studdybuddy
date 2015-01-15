class PostsController < ApplicationController
	skip_before_action :authenticate_user!, only: [:welcome]

	def search
		@posts = Post.search(params[:search])
	end

	def welcome
		@disable_logout = true
	end

	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 10).order('id DESC')
		@post = Post.new
	end

	def create
		@post = current_user.posts.build(post_params)

		@post.save
		respond_to do |format|
			format.html { redirect_to @post, notice: "Study request successfully added" }
			format.js {}
			format.json { render json: @post, status: :created, location: @post }
		end
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


	private

	def post_params
		params.require(:post).permit(:course_name, :course_number)
	end

	def authorized_user
		current_user == @post.user
	end
end
