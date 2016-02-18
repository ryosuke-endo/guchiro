require 'rails_helper'

RSpec.feature "UsersSignups", type: :feature do
  it 'valid signup information' do
    visit new_user_path
    fill_in 'user[email]', with: 'test@yahoo.co.jp'
    fill_in 'user[password]', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_on '会員登録'
    expect(page).to have_content('編集')
    expect(current_path).to eq user_path(1)
  end

  it 'unvalid signup information less than 6 of charcters' do
    visit new_user_path
    fill_in 'user[email]', with: 'test@yahoo.co.jp'
    fill_in 'user[password]', with: 'a' * 5
    fill_in 'user[password_confirmation]', with: 'a' * 5
    click_on '会員登録'
    expect(page).to have_content('無料会員登録')
    expect(current_path).to eq users_path
  end
end
