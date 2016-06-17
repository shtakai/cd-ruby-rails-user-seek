class LikesController < ApplicationController
  before_action :require_login, only: [ :create ]

  def create
    @secret = Secret.find_by_id params[:secret_id]
    Like.create user: current_user,
                secret: @secret
    redirect_to "/secrets"
  end



end
