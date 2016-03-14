require 'rails_helper'

RSpec.feature 'PostSympaties', type: :feature do
  before do
    @user = create(:mikami)
    @other_user = create(:ayu)
  end

  it 'not login user redirect when click sympathy button' do
    visit root_path
    click_link '共感', match: :first
    expect(current_path).to eq login_path
  end

  it 'user click sympathy button and cheer count up' do
    login(@user)
    click_link '共感', match: :first
    expect(page).to have_selector('.sympathy_count', text: 1)
    expect(page).to have_content('共感済み')
    logout
    login(@other_user)
    click_link '共感', match: :first
    expect(page).to have_selector('.sympathy_count', text: 2)
  end

  it 'user click sympathy button and sympathy count down' do
    login(@user)
    click_link '共感', match: :first
    expect(page).to have_selector('.sympathy_count', text: 1)
    click_link '共感済み'
    expect(page).to have_selector('.sympathy_count', text: 0)
  end

  it 'redirect current_path when user click sympathy button in grumble comment show page' do
    grumble = create(:tsukareta)
    login(@user)
    click_on 'コメント', match: :first
    click_link '共感'
    expect(current_path).to eq grumble_path(grumble)
    expect(page).to have_selector('.sympathy_count', text: 1)
    click_link '共感済み'
    expect(page).to have_selector('.sympathy_count', text: 0)
  end
end
