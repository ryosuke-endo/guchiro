require 'rails_helper'

RSpec.describe Grumble, type: :model do
  before do
    @post = create(:post)
  end

  it 'Grumble body should be valid' do
    @post.body = nil
    expect(@post).not_to be_valid
  end

  it ' Grumble body should be less than 300 of characters' do
    @post.body = 'a' * 350
    expect(@post).not_to be_valid
  end
end
