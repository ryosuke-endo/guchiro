module ApplicationHelper
  include SeoHelper

  def active?(controller_name, controller_action)
    if controller_name == params[:controller] && controller_action == params[:action]
      'active'
    end
  end

  def cheer_attrs(user, grumble)
    if !current_user
      'signin_required'
    elsif grumble.user == current_user
      'is-owner is-disable'
    elsif @user_grumble_cheers.include?(grumble.id)
      'on'
    else
      'off'
    end
  end

  def sympathy_attrs(user, grumble)
    if !current_user
      'signin_required'
    elsif grumble.user == current_user
      'is-owner is-disable'
    elsif @user_grumble_sympathies.include?(grumble.id)
      'on'
    else
      'off'
    end
  end
end
