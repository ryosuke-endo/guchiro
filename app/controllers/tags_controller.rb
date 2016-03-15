class TagsController < ApplicationController
  skip_before_action :require_login, only: [:index]
  def index
    @tags = Grumble.tag_counts_on(:tags).order(taggings_count: :desc)
  end
end
