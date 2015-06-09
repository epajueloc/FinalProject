class PostingsController < ApplicationController
	def index
		@postings = Postings.all.order(:created_at)
	end

	def new
		@user = current_user
		@posting = current_user.postings.build
	end
	
	def create
		@user = current_user
		@posting = current_user.postings.build(posting_params)

		if @posting.save
			redirect_to user_posting_path(current_user,@posting)
		else
			render :new
		end
	end

	def show
		@user = current_user
		@posting = Posting.find(params[:id])
		#@pins = Pin.where(posting_id: @posting) #.id)
	end

	def edit
		@posting = Posting.find(params[:id])
	end

	def update
		@posting = Posting.find(params[:id])

		if @posting.update(posting_params)
			redirect_to user_posting_path(current_user,@posting)
		else
			render :edit
		end
	end

	def destroy
		@posting = Posting.find(params[:id])
		@posting.destroy
		redirect_to user_postings_path
	end

	private
	def posting_params
		params.require(:posting).permit(:name,:description,:date,:compensation,:phone,:email)
	end

end
