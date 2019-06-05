module SessionsHelper

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def require_sign_in
      redirect_to login_path unless current_user
  end
  
  def user_signed_in?
    !@current_user.nil?
  end
end
