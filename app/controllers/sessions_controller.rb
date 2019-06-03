class SessionsController < ApplicationController
  # skip_before_action :require_sign_in, only: [:login]
  skip_before_action :current_user, only: [:create]

  def create
    if params[:session]
      @user = User.find_by(email: params[:session][:email])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(session[:user_id])
      else
        render("/users/login")
      end
    end
  end

  def destroy
    session[:user_attributes] = nil
    @current_user = nil
    redirect_to login_users_path
  end


  private
  def session_params
    params.require(:session).permit(:nickname, :email, :password)
  end
end
