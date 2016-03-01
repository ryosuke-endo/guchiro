class CheersController < ApplicationController
  def create
    @grumble = Grumble.find(params[:grumble_id])
    cheer = current_user.cheers.build(grumble_id: @grumble.id)
    cheer.save
    redirect_to root_url
  end

  def destroy
    @grumble = Grumble.find(params[:grumble_id])
    cheer = current_user.cheers.find_by(grumble_id: @grumble.id)
    cheer.destroy
    redirect_to root_url
  end
end
