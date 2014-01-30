class UsersController < ApplicationController
  # All actions in this controller require the presence of an authenticated user.
  before_filter :authenticate_user!

  before_filter :username_exists?, only: :show
  
  def show
  end
  
  private
  def username_exists?
    unless User.exists?({ :username => params[:username] })
      flash[:error] = "Invalid username"
      redirect_to :root
    end
  end
  
  def user_params
    params.require(:user).permit(:username)
  end
end
