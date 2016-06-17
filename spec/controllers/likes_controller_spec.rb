require 'rails_helper'

RSpec.describe LikesController, type: :controller do
  before do
    @user = create_user
    @secret = @user.secrets.create content: 'secret'
    @like = Like.create secret: @secret, user: @user
  end

  describe 'when not logged in' do
    before do
      session[:user_id] = nil
    end

    it 'cannot like' do
      post :create
      expect(response).to redirect_to '/sessions/new'
    end

    it 'cannot unlike' do
      delete :destroy, id: @like.id
      expect(response).to redirect_to '/sessions/new'
    end
  end

  describe 'when signed in as the wrong user' do
    before do
      @wrong_user = create_user 'sashimi', 'sashimi@lakers.com'
      session[:user_id] = @wrong_user.id
    end

    it 'can like' do
      post :create, secret_id: @secret.id
      expect(response).to redirect_to '/secrets'
    end

    it 'can unlike' do
      post :create, secret_id: @secret.id
      expect(response).to redirect_to '/secrets'
      delete :destroy, id: @like.id
      expect(response).to redirect_to '/secrets'
    end
  end



end
