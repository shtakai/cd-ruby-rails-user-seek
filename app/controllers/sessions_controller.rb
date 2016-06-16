class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      session.clear
      flash[:alert] = 'Invalid'
      render 'sessions/new'
    end
  end

  def destroy
    session.clear
    redirect_to '/sessions/new'
  end
end
