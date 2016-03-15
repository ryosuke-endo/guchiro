class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_filter :require_login, :set_request_filter
  protect_from_forgery with: :exception

  def set_request_filter
    Thread.current[:request] = request
  end

  private

  def not_authenticated
    redirect_to login_path, flash: { notice: t('notice') }
  end
end
