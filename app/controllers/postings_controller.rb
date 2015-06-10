class PostingsController < ApplicationController
	  before_action :authenticate_user!
	def index
		@postings = Posting.all.order(:created_at)
	end

	def new
		@user = current_user
		@client = User.find(params[:client_id])
		@posting = @client.postings.build
	end
	
	def create
		@user = current_user
		@posting = current_user.postings.build(posting_params)
		categories = params[:posting][:category_ids]
		categories.pop
		categories.each do |k|
		   @posting.categories << Category.find(k.to_i)
		end
		if @posting.save
			redirect_to client_posting_path(current_user, @posting)
		else
			render :new
		end
	end

	def show
		@user = current_user
		@posting = Posting.find(params[:id])
	end

	def edit
		@posting = Posting.find(params[:id])
	end

	def update
		@posting = Posting.find(params[:id])

		if @posting.update(posting_params)
			redirect_to client_posting_path(current_user,@posting)
		else
			render :edit
		end
	end

	def destroy
		@posting = Posting.find(params[:id])
		@posting.destroy
		redirect_to client_postings_path
	end

	private
	def posting_params
		params.require(:posting).permit(:title,:description,:date,:compensation,:phone,:email)
	end

end
