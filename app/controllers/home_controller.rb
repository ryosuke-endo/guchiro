class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @grumbles = Grumble.order(created_at: :desc).page params[:page]
  end
end
