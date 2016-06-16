class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:user][:email])

    p params[:user][:email]
    p params[:user][:password]
    p @user
    if @user.authenticate(params[:user][:password])
      logger.debug @user
      p '---------------------------'
      p @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:alert] = 'Invalid'
      render 'sessions/new'
    end
  end
end
