module ApplicationHelper
  def active?(controller_name, controller_action)
    if controller_name == params[:controller] && controller_action == params[:action]
      'active'
    end
  end
end
