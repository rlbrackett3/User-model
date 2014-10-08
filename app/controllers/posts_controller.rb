class PostsController < ApplicationController

	def new
	end

	def create
		@post = Post.new(post_params)

    if @post.save
      flash[:notice] = "Your post was created."
      redirect_to post_path @post
    else
      flash[:alert] = "Error creating reply."
      redirect_to new_post_path
    end
	end

	def show
		@post = Post.find(params[:id])
	end

	private

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
