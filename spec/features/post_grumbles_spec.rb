require 'rails_helper'

RSpec.feature "PostGrumbles", type: :feature do

  it 'grumble post is success' do
    visit new_grumble_path
    text = attributes_for(:tsukareta)
    fill_in 'grumble[body]', with: text[:body]
    click_button 'ぐちを投稿'
    grumble = Grumble.first
    expect(grumble.anonymous_digest).to be_truthy
    expect(current_url).to eq root_url
    expect(page).to have_content(text[:body])
  end

  it 'grumble post is unsuccess' do
    visit new_grumble_path
    fill_in 'grumble[body]', with: ''
    click_button 'ぐちを投稿'
    expect(page).to have_selector('#error_explanation')
  end

  it 'user grumble post is only login user showing grumble post' do
    user = create(:mikami)
    other_user = create(:ayu)
    login(user)
    text = attributes_for(:tsukareta)
    visit new_grumble_path
    fill_in 'grumble[body]', with: text[:body]
    click_button 'ぐちを投稿'
    visit grumbles_path
    expect(page).to have_content(text[:body])
    logout
    login(other_user)
    visit grumbles_path
    expect(page).not_to have_content(text[:body])
  end

  it 'user grumble post with hash tag' do
    visit new_grumble_path
    text = attributes_for(:muritag)
    fill_in 'grumble[body]', with: text[:body]
    click_button 'ぐちを投稿'
    expect(page).to have_selector('#tag_list', '仕事')
  end
end
