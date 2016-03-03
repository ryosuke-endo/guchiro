class GrumblesController < ApplicationController
  skip_before_action :require_login, only: [:new, :show, :create]

  def index
    @user = current_user
    @grumbles = @user.grumbles.order(created_at: :desc).page(params[:page])
  end

  def new
    @grumble = Grumble.new
  end

  def show
    @grumble = Grumble.find_by(id: params[:id])
    @comment = @grumble.comments.new
    @comments = @grumble.comments.includes(:grumble)
  end

  def create
    @grumble = Grumble.new(grumble_params)
    @grumble.user = current_user
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
