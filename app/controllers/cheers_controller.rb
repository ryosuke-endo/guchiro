class CheersController < ApplicationController
  before_action :set_cheer, only: [:create, :destroy]

  def index
    @user = current_user
    @grumbles = @user.cheer_grumbles.order(created_at: :desc).page(params[:page])
  end

  def create
    cheer = current_user.cheers.build(grumble_id: @grumble.id)
    cheer.save
    redirect_to(:back)
  end

  def destroy
    cheer = current_user.cheers.find_by(grumble_id: @grumble.id)
    cheer.destroy
    redirect_to(:back)
  end

  private
    def set_cheer
      @grumble = Grumble.find(params[:grumble_id])
    end
end
