class WorkersController < ApplicationController
	  before_action :authenticate_user!
	def index
		@categories = Category.all
		@user = current_user
	end

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
	end

	# private
	# def user_params
	# 	params.require(:user).permit(:name,:description,:email,:phone,:email, :role, :avatar)
	# end

end
