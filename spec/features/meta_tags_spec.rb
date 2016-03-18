require 'rails_helper'

RSpec.feature "MetaTags", type: :feature do
  before do
    @site = I18n.t('meta_site_title')
  end
  it 'top page title check' do
    @title = I18n.t('meta_title')
    @sitetitle = @site + ' | ' + @title
    visit root_path
    expect(page).to have_title(@sitetitle)
  end

  it 'comment page title check' do
    @grumble = create(:post)
    @title = @grumble.body
    @sitetitle = @title + ' | ' + @site
    visit grumble_path(@grumble)
    expect(page).to have_title(@sitetitle)
  end
end
