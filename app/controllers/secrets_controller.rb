class SecretsController < ApplicationController
  def create
    @secret = Secret.new(secret_params)
    @user = current_user
    @secret.user = @user
    @secret.save
    redirect_to "/users/#{@user.id}"
  end

  private

  def secret_params
    params.require(:secret).permit(:content)
  end
end
