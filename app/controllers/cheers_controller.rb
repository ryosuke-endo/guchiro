class CheersController < ApplicationController
  before_action :set_cheer, only: [:create, :destroy]

  def index
    @user = current_user
    @grumbles = @user.cheer_grumbles.page(params[:page]).including_tags
  end

  def create
    cheer = current_user.cheers.build(grumble_id: @grumble.id)
    cheer.save
    respond_to do |format|
      format.html { render nothing: true }
      format.js { render nothing: true }
    end
  end

  def destroy
    cheer = current_user.cheers.find_by(grumble_id: @grumble.id)
    cheer.destroy
    respond_to do |format|
      format.html { render nothing: true }
      format.js { render nothing: true }
    end
  end

  private

  def set_cheer
    @grumble = Grumble.find(params[:grumble_id])
  end
end
