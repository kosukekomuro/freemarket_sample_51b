class ProductsController < ApplicationController

    before_action :set_product, only: [:buy, :create]
    before_action :set_user, only: [:create]

    def index
        set_pickup_category(1,2,3,7)
        set_pickup_brand(1,593,340,58)
    end

    def new
        @category_parents = Category.all.order("id ASC").limit(13)
        @delivery_parents = DeliveryMethod.all.order("id ASC").limit(2)
    end

    #商品の簡易検索を行う
    def search
    end

    #商品の詳細情報の表示を行う
    def show
    end

    #商品の購入確認を行う
    def buy
        @product = Product.find(1)
    end

    def create
        Payjp.api_key = 'sk_test_af9066f8b2f898d1e31d957c'
        product = Product.find(1)
        user = User.find(1)
        charge = Payjp::Charge.create(
          amount: product.price,
          customer: user.card_id,
          currency: 'jpy',
        )
        redirect_to action: :index
    end

    def create
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
        charge = Payjp::Charge.create(
          amount: @product.price,
          customer: @user.card_id,
          currency: 'jpy',
        )
        redirect_to action: :index
    end

    private
    def set_pickup_category(first, second, third, fourth)
        @category_first = Category.find(first)
        @category_first_items = Product.where(category_id: first)

        @category_second = Category.find(second)
        @category_second_items = Product.where(category_id: second)

        @category_third = Category.find(third)
        @category_third_items = Product.where(category_id: third)

        @category_fourth = Category.find(fourth)
        @category_fourth_items = Product.where(category_id: fourth)
    end

    def set_pickup_brand(first, second, third, fourth)
        @brand_first = Brand.find(first)
        @brand_first_items = Product.where(brand_id: first)

        @brand_second = Brand.find(second)
        @brand_second_items = Product.where(brand_id: second)

        @brand_third = Brand.find(third)
        @brand_third_items = Product.where(brand_id: third)

        @brand_fourth = Brand.find(fourth)
        @brand_fourth_items = Product.where(brand_id: fourth)
    end

    def set_product
        @product = Product.find(1)
    end

    def set_user
        @user = User.find(1)
    end
end
