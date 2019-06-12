class UsersController < ApplicationController
  before_action :require_sign_in, only: :registration_complete
  before_action :save_to_session, only: :address_registration
  before_action :sns_login, only: :user_registration
  layout 'users'

  def login
  end

  def sign_up
  end

  def user_registration
    @user = User.new
    if @sns_email
      @sns_name
      @sns_email
    else
      @sns_name = ""
      @sns_email = ""
    end
  end

  def sms_confirmation
  end

  def address_registration
    @user = User.new
    @user.build_user_detail
    @user.build_user_address
  end

  def card_registration
    session[:user_detail_attributes] = user_params[:user_detail_attributes]
    session[:user_address_attributes] = user_params[:user_address_attributes]
  end

  def registration_complete
  end

  def create
    respond_to do |format|
      format.json{
        @user = User.new(
          nickname: session[:nickname],
          email: session[:email],
          password: session[:password],
          password_confirmation: session[:password_confirmation]
        )
        @user.build_user_detail(session[:user_detail_attributes])
        @user.build_user_address(session[:user_address_attributes])
        token = params[:token]
        response_customer = Payjp::Customer.create(
          card: token
        )
        card = response_customer.id
        @user.card_id = card
        if @user.save
          session[:user_id] = @user.id
        end
      }
    end
  end

  def sns_login
    sns_email = request.env['omniauth.auth']['info']['email'] rescue nil
    return false unless sns_email
    user = User.find_by(email: sns_email)
    if user
      session[:user_id] = user.id
      redirect_to root_path
    else
      @sns_name = request.env['omniauth.auth']['info']['name'] rescue nil
      @sns_email = request.env['omniauth.auth']['info']['email'] rescue nil
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
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

  def save_to_session
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    @user = User.new(
      nickname: user_params[:nickname],
      email: user_params[:email],
      password: user_params[:password],
      password_confirmation: user_params[:password_confirmation]
    )
    render '/users/user_registration' unless @user.valid?
  end
end
