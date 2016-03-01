require 'rails_helper'

RSpec.feature "PostCheers", type: :feature do
  before do
    grumbles = create(:post)
  end

  it 'not login user redirect to new page when click cheer link' do
    visit root_path
    click_link '応援'
    expect(current_path).to eq login_path
  end

  it 'user click cheer button and cheer count up' do
    user = create(:mikami)
    other_user = create(:ayu)
    login(user)
    click_link '応援'
    expect(page).to have_selector('.cheer-count', text: 1)
    expect(page).to have_content('応援済み')
    logout
    login(other_user)
    click_link '応援'
    expect(page).to have_selector('.cheer-count', text: 2)
  end

  it 'user click cheer button and cheer count down' do
    user = create(:mikami)
    login(user)
    click_link '応援'
    expect(page).to have_selector('.cheer-count', text: 1)
    click_link '応援済み'
    expect(page).to have_selector('.cheer-count', text: 0)
  end
end
