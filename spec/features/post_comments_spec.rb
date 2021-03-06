require 'rails_helper'

RSpec.feature "PostComments", type: :feature do
  before do
    @user = create(:mikami)
    @other_user = create(:ayu)
  end

  it 'not login user post comment and comment is count up' do
    grumble = create(:tsukareta)
    visit root_path
    click_on 'コメント', match: :first
    text = 'そういうこともある'
    fill_in 'comment[body]', with: text
    click_on 'コメントを投稿'
    comment = Comment.first
    expect(comment.anonymous_digest).to be_truthy
    expect(current_path).to eq grumble_path(grumble)
    expect(page).to have_selector('.comment_count', text: 1)
    expect(page).to have_content(text)
  end

  it 'login user post comment and delete comment' do
    visit root_path
    login(@user)
    click_on 'コメント', match: :first
    text = 'そういうこともある'
    fill_in 'comment[body]', with: text
    click_on 'コメントを投稿'
    expect(page).to have_selector('.comment_count', text: 1)
    click_on 'コメントを消す'
    expect(page).to have_selector('.comment_count', text: 0)
  end

  it 'wrong user do not delete comment' do
    visit root_path
    login(@user)
    click_on 'コメント', match: :first
    text = 'そういうこともある'
    fill_in 'comment[body]', with: text
    click_on 'コメントを投稿'
    logout
    login(@other_user)
    click_on 'コメント', match: :first
    expect(page).to have_selector('.comment_count', text: 1)
    expect(page).not_to have_content('コメントを消す')
  end
end
