class UsersController < ApplicationController
  before_action :require_sign_in, only: :registration_complete
  layout 'users'

  def show
  end

  def login
  end

  def sign_up
  end

  def user_registration
    @user = User.new
  end

  def sms_confirmation
  end

  def address_registration
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    @user = User.new
    @user.build_user_detail
    @user.build_user_address
  end

  def card_registration
  end

  def registration_complete
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password]
    )
    @user.build_user_detail(user_params[:user_detail_attributes])
    @user.build_user_address(user_params[:user_address_attributes])
    if @user.save
      session[:user_id] = @user.id
      redirect_to registration_complete_users_path
    else
      render '/users/user_registration'
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      user_detail_attributes: [
        :id,
        :last_name,
        :first_name,
        :last_name_kana,
        :first_name_kana
      ],
      user_address_attributes: [
        :id,
        :postal_code,
        :prefecture_id,
        :municipalitie,
        :address,
        :building_name
      ]
    )
  end

  # 条件チェック用のアクション
  # application_controllerのアクションをオーバーライド
  def use_search_header_category?
    false
  end
end
