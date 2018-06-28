class ApplicationController < ActionController::Base
  # before_action :require_login
 
  helper_method def current_user
  @current_user ||= User.find_by(id: session[:user_id]) if session.key? 'user_id'
end

def require_login
  return redirect_to :root unless session.key? 'user_id'
end
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
end
