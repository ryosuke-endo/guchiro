require 'rails_helper'

RSpec.describe GrumblesController, type: :controller do
  it 'post grumble is redirect to top page' do
    post :create, grumble: { body: 'aaaaaa' }
    expect(response).to redirect_to root_path
  end
end
