class ClientsController < ApplicationController
	before_action :authenticate_user!
	def index

		if current_user.client?
				@categories = Category.all
				@user = current_user
		elsif current_user.worker?
			redirect_to :root, alert: "You don't have permission to access this page."
		end
	end
end
