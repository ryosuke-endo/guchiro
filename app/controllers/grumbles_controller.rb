class GrumblesController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @grumble = Grumble.new
  end

  def create
    @grumble = Grumble.new(grumble_params)
    if @grumble.save
      redirect_to root_url
    else
      render 'grumbles/new'
    end
  end

  private

    def grumble_params
      params.require(:grumble).permit(:body)
    end
end
