require 'rails_helper'

RSpec.feature 'PostCheers', type: :feature do
  context 'no user have grumble' do
    before do
      @user = create(:papasu)
      @other_user = create(:ayu)
      @grumble = create(:grumble)
    end

    it 'not login user redirect when click cheer button', js: true do
      visit root_path
      find('.cheer_button').click
      expect(current_path).to eq login_path
    end

    it 'user click cheer button and cheer count up', js: true do
      login(@user)
      find('.cheer_button').click
      expect(page).to have_selector('.cheer_count', text: 1)
      logout
      login(@other_user)
      find('.cheer_button').click
      expect(page).to have_selector('.cheer_count', text: 2)
    end

    it 'user click cheer button and cheer count down', js: true do
      login(@user)
      find('.cheer_button').click
      expect(page).to have_selector('.cheer_count', text: 1)
      find('.cheer_button').click
      expect(page).to have_selector('.cheer_count', text: 0)
    end

    it 'comment page when user click cheer button in grumble comment show page', js: true do
      login(@user)
      click_on 'コメント', match: :first
      find('.cheer_button').click
      expect(current_path).to eq grumble_path(@grumble)
      expect(page).to have_selector('.cheer_count', text: 1)
      find('.cheer_button').click
      expect(page).to have_selector('.cheer_count', text: 0)
    end
  end

  it 'my grumble post do not click cheer', js: true do
    @mikami = create(:mikami)
    login(@mikami)
    find('.cheer_button').click
    expect(page).to have_selector('.cheer_count', text: 0)
  end
end
