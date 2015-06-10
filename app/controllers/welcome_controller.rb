class WelcomeController < ApplicationController

  def index
  	if current_user.client?
  		redirect_to clients_path
  	elsif current_user.worker?
  		redirect_to workers_path
  	end
  end
end
