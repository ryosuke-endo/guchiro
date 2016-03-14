class SympathiesController < ApplicationController
  before_action :set_sympathy, only: [:create, :destroy]

  def index
    @user = current_user
    @grumbles = @user.sympathy_grumbles.order(created_at: :desc).page(params[:page])
  end

  def create
    sympathy = current_user.sympathies.build(grumble_id: @grumble.id)
    sympathy.save
    redirect_to(:back)
  end

  def destroy
    sympathy = current_user.sympathies.find_by(grumble_id: @grumble.id)
    sympathy.destroy
    redirect_to(:back)
  end

  private
    def set_sympathy
      @grumble = Grumble.find(params[:grumble_id])
    end
end
