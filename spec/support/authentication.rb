module AuthenticationForFeatureRequest
  def login(user)
    visit new_user_session_path
    fill_in 'email', with: user.email
    fill_in 'password', with: 'password'
    click_button 'ログイン'
    visit root_path
  end

  def logout
    click_link 'ログアウト', href: logout_path
  end
end
