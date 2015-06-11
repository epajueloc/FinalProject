class WorkersController < ApplicationController
	  before_action :authenticate_user!
	def index
		if current_user.worker?
			@categories = Category.all
			@user = current_user
		elsif current_user.client?
			redirect_to :root, alert: "You don't have permission to access this page."
		end
	end

	def show
			@user = User.find(params[:id])
			@category = Category.find(params[:category_id])
	end

	def edit
		if current_user.worker?
		@worker = current_user
		@categories = Category.all
		elsif current_user.client?
			redirect_to :root, alert: "You don't have permission to access this page."
		end
	end

	def update

		if current_user.worker?

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

		elsif current_user.client?
			redirect_to :root, alert: "You don't have permission to access this page."
		end

	end

	private
	def worker_params
		params.require(:user).permit(:name,:description,:email,:phone,:email, :role, :avatar)
	end

end
