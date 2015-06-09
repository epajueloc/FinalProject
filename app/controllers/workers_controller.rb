class WorkersController < ApplicationController
	  before_action :authenticate_user!
	def index
		@user = current_user
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
