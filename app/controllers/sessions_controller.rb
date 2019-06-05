class SessionsController < ApplicationController
  # skip_before_action :require_sign_in, only: [:login]
  skip_before_action :current_user, only: [:create]

  def create
    if params[:session]
      @user = User.find_by(email: session_params[:email])
      if @user && @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to user_path(session[:user_id])
      else
        render("/users/login")
      end
    end
  end

  def destroy
    reset_session
    @current_user = nil
    redirect_to login_users_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
