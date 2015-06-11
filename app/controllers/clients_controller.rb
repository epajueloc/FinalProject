class ClientsController < ApplicationController
	before_action :authenticate_user!
	def index
		@categories = Category.all
		@user = current_user
	end
end
