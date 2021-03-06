class LikesController < ApplicationController
  before_action :require_login, only: [ :create, :destroy ]
  before_action :require_correct_user, only: []

  def create
    @secret = Secret.find_by_id params[:secret_id]
    Like.create user: current_user,
                secret: @secret
    redirect_to "/secrets"
  end

  def destroy
    like = Like.find_by_id(params[:id])
    like.destroy
    redirect_to "/secrets"
  end
end
