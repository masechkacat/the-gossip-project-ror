class ApplicationController < ActionController::Base
    helper_method :current_user
    

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless current_user
      flash[:error] = "Вы должны войти в систему для доступа к этой странице"
      redirect_to sessions_path
    end
  end
end
