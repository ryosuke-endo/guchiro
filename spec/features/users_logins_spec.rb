require 'rails_helper'

RSpec.feature "UsersLogins", type: :feature do
  before do
    @user = create(:mikami)
    @other_user = create(:ayu)
  end

  it 'redirect to mypage when show other user page' do
    login(@user)
    visit user_path(@other_user)
    expect(current_path).to eq user_path(@user)
  end

  it 'redirect to mypage when show other user edit page' do
    login(@user)
    visit edit_user_path(@other_user)
    expect(current_path).to eq user_path(@user)
  end

  it 'check user post list page' do
    login(@user)
    visit user_path(@user)
    find('.my_post-grumble').click
    expect(current_path).to eq user_grumbles_path(@user)
  end
end
