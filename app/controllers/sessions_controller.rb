class SessionsController < ApplicationController
  before_action :current_user, only: :destroy

  def create
    if params[:session]
      @user = User.find_by(email: session_params[:email])
      if @user && @user.authenticate(session_params[:password])
        session[:user_id] = @user.id
        redirect_to root_path
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
