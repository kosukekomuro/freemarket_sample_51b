class CardsController < ApplicationController

  before_action :access_payjp, only: [:index, :create, :destroy]

  def index
    if !(@current_user.card_id.nil?)
      customer = Payjp::Customer.retrieve(@current_user.card_id)
      @card = customer.cards.retrieve(customer.cards.data[0].id)
      select_card_image()
    end
  end
  
  def new
  end
  
  def create
    respond_to do |format|
      format.json {
        token = params[:token]
        response_customer = Payjp::Customer.create(
          card: token
        )
        card = response_customer.id
        @current_user.update(card_id: card)
      }
    end
  end

  def destroy
    customer = Payjp::Customer.retrieve(@current_user.card_id)
    customer.delete
    @current_user.update(card_id: nil)
    redirect_to action: :index
  end

  private
  def select_card_image
    if @card.brand == "Visa"
      @url = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?3856598694"
    elsif @card.brand == "MasterCard"
      @url = "//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?3856598694"
    elsif @card.brand == "JCB"
      @url = "//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?3856598694"
    elsif @card.brand == "American Express"
      @url = "//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?3856598694"
    elsif @card.brand == "Diners Club"
      @url = "//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?3856598694"
    elsif @card.brand == "Discover"
      @url = "//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?3856598694"
    end
  end

  def access_payjp
    require 'payjp'
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  end

end
