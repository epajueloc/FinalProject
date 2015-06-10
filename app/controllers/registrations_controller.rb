class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	sign_in_and_redirect(@user)
    else
    	redirect_to root_path
    end
  end

  def update
    super
  end
  def after_sign_up_path_for(resource)
    '/'
  end
  private
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :phone, :description, :role, :avatar)
  end
end 