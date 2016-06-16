class UsersController < ApplicationController
  def show
    @user = User.find_by_id params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to "/users/#{@user.id}"
    else
      flash[:errors] = @user.errors.messages
      redirect_to '/users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
