require 'rails_helper'

RSpec.feature 'Tags', type: :feature do
  it 'tag list page when user grumble post with tag' do
    visit root_path
    text = attributes_for(:muritag)
    fill_in 'grumble[body]', with: text[:body]
    find('.grumble-button').click
    find('.tag_list_name', text: '仕事').click
    expect(page).to have_content('「仕事」に関する一覧')
  end
end
