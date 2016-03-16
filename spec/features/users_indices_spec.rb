require 'rails_helper'

RSpec.feature "UsersIndices", type: :feature do
  before do
    @admin = create(:mikami)
    @non_admin = create(:ayu)
  end

  it 'not admin user redirect to root' do
    login(@non_admin)
    visit users_path
    expect(current_path).to eq root_path
    logout
    login(@admin)
    visit users_path
    expect(current_path).to eq users_path
  end
end
