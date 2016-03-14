require 'rails_helper'

RSpec.feature 'PostInquiries', type: :feature do
  it 'post inquiry unsuccess with not fillng field' do
    visit inquiry_index_path
    fill_in 'inquiry[name]', with: 'test'
    fill_in 'inquiry[email]', with: 'test'
    fill_in 'inquiry[message]', with: ''
    find('.inquiry-button').click
    expect(page).to have_selector('.alert')
  end
end
