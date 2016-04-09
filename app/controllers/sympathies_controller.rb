class SympathiesController < ApplicationController
  before_action :set_sympathy, only: [:create, :destroy]

  def index
    @user = current_user
    @grumbles = @user.sympathy_grumbles.page(params[:page]).including_tags
  end

  def create
    @sympathy = Sympathy.new(user_id: current_user.id, grumble_id: @grumble.id)
    @sympathy.save
    respond_to do |format|
      format.html { render nothing: true }
      format.js { render nothing: true }
    end
  end

  def destroy
    @sympathy = Sympathy.find_by(user_id: current_user.id, grumble_id: @grumble.id)
    @sympathy.destroy
    respond_to do |format|
      format.html { render nothing: true }
      format.js { render nothing: true }
    end
  end

  private

  def set_sympathy
    @grumble = Grumble.find(params[:grumble_id])
  end
end
