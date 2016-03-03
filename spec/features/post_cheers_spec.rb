require 'rails_helper'

RSpec.feature "PostCheers", type: :feature do
  before do
    @user = create(:mikami)
    @other_user = create(:ayu)
  end

  it 'not login user redirect when click cheer button' do
    visit root_path
    click_link '応援', match: :first
    expect(current_path).to eq login_path
  end

  it 'user click cheer button and cheer count up' do
    login(@user)
    click_link '応援', match: :first
    expect(page).to have_selector('.cheer-count', text: 1)
    expect(page).to have_content('応援済み')
    logout
    login(@other_user)
    click_link '応援', match: :first
    expect(page).to have_selector('.cheer-count', text: 2)
  end

  it 'user click cheer button and cheer count down' do
    login(@user)
    click_link '応援', match: :first
    expect(page).to have_selector('.cheer-count', text: 1)
    click_link '応援済み'
    expect(page).to have_selector('.cheer-count', text: 0)
  end

  it 'redirect current_path when user click cheer button in grumble comment show page' do
    login(@user)
    grumble = Grumble.last
    click_on 'コメント', match: :first
    click_link '応援'
    expect(current_path).to eq grumble_path(grumble.id)
    expect(page).to have_selector('.cheer-count', text: 1)
    click_link '応援済み'
    expect(page).to have_selector('.cheer-count', text: 0)
  end
end
