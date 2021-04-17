class UsersController < ApplicationController
    before_action :authenticate_user!
    before_action :find_user, only: [:edit, :update]
  def index
  end

  def show
  end

  def edit

  end
  def update
    if @user.update(user_params)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      render 'edit'
    end

  end

  private
  
  def find_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :last_name, :first_name, :affiliation_id)
  end
end
