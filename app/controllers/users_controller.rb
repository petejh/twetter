class UsersController < ApplicationController
  # All actions in this controller require the presence of an authenticated user.
  before_filter :authenticate_user!

  before_filter :username_exists?, only: :show
  
  def show
    @user = User.find_by_username(params[:username])
    @twets = Twet.by_user_ids(@user.id)
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
