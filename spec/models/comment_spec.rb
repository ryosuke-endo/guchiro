require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = create(:comment)
  end
  it 'comment body should be valid' do
    @comment.body = nil
    expect(@comment).not_to be_valid
  end
end
