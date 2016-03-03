require 'rails_helper'

RSpec.describe SympathiesController, type: :controller do
  it 'should redirect when not login user' do
    post :create, grumble_id: 1
    expect(response).to redirect_to login_path
  end
end
