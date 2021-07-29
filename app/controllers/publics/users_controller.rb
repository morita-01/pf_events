class Publics::UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    end
  end
  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to publics_user_path
    else
      render "edit"
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :profile_image)
  end
  
end
