class UsersController < ApplicationController
	
	def index
		
	end

	def create
		@user = User.new(user_params)
		if @user.save
		flash[:notice] = "Welcome to the site!"
		redirect_to root_path
		else
		flash[:alert] = "There was a problem creating your account. Please try again."
		redirect_to :back
		end
	end

	private
		def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
		end

end