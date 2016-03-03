require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  before do
    @grumble = create(:king)
  end

  it 'should destroy redirect when not logged in' do
    expect { Comment.count }.not_to change {
      post :destroy, id: @grumble.comments.first.id, grumble_id: @grumble
    }
    expect(response).to redirect_to login_path
  end
end
