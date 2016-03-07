require 'rails_helper'

RSpec.describe UserSessionsController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #destroy" do
    it "redirect to root path" do
      user = create(:mikami)
      login_user(user)
      post :destroy, id: user
      expect(response).to redirect_to root_path
    end
  end

end
