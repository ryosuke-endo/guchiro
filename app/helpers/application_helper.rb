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
    elsif Grumble.grumbled_by_user(user, grumble) == current_user
      'is-owner is-disable'
    elsif Cheer.cheered_by_user?(current_user, grumble)
      'on'
    else
      'off'
    end
  end

  def sympathy_attrs(user, grumble)
    if !current_user
      'signin_required'
    elsif Grumble.grumbled_by_user(user, grumble) == current_user
      'is-owner is-disable'
    elsif Sympathy.sympathied_by_user?(current_user, grumble)
      'on'
    else
      'off'
    end
  end
end
