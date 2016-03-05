class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :require_login

  private
    def not_authenticated
      redirect_to login_path, alert: 'Please login first'
    end

    def get_anonymous_name
      user_ip = request.ip
      day = Date.today.to_s
      anonymous_name = user_ip + day
    end

    def get_anonymous_digest(anonymous_name, character_length)
      anonymous_digest = Digest::MD5.hexdigest(anonymous_name).slice(0..character_length)
    end
end
