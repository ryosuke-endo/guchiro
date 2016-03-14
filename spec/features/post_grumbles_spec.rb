require 'rails_helper'

RSpec.feature 'PostGrumbles', type: :feature do

  it 'grumble post is success' do
    visit root_path
    text = attributes_for(:tsukareta)
    fill_in 'grumble[body]', with: text[:body]
    find('.grumble-button').click
    grumble = Grumble.first
    expect(grumble.anonymous_digest).to be_truthy
    expect(current_url).to eq root_url
    expect(page).to have_content(text[:body])
  end

  it 'grumble post is unsuccess' do
    visit root_path
    fill_in 'grumble[body]', with: ''
    expect { find('.grumble-button').click }.not_to change {
      Grumble.count
    }
  end

  it 'user grumble post is only login user showing grumble post' do
    user = create(:mikami)
    other_user = create(:ayu)
    login(user)
    text = attributes_for(:tsukareta)
    visit root_path
    fill_in 'grumble[body]', with: text[:body]
    find('.grumble-button').click
    visit user_grumbles_path(user)
    expect(page).to have_content(text[:body])
    logout
    login(other_user)
    visit user_grumbles_path(other_user)
    expect(page).not_to have_content(text[:body])
  end

  it 'user grumble post with hash tag' do
    visit root_path
    text = attributes_for(:muritag)
    fill_in 'grumble[body]', with: text[:body]
    find('.grumble-button').click
    expect(page).to have_selector('.tag_list', '仕事')
  end
end
