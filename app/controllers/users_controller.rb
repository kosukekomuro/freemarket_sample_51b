class UsersController < ApplicationController
  before_action :require_sign_in, only: :registration_complete
  layout 'users'

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
          password: session[:password]
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
