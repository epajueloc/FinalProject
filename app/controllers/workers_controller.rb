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
		@worker = current_user
		@categories = Category.all
	end

	def update
		@worker = current_user
		@worker.update(worker_params)
		worker_categories = params[:user][:user][:category_ids]
		worker_categories.pop
		@worker.categories = []
		worker_categories.each do |category_id|
			@worker.categories << Category.find(category_id.to_i)
		end
		@worker.save
		redirect_to worker_path @worker
	end

	private
	def worker_params
		params.require(:user).permit(:name,:description,:email,:phone,:email, :role, :avatar)
	end

end
