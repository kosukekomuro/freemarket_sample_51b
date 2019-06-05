class ProductsController < ApplicationController

  before_action :set_product, only: [:buy, :create]
  before_action :set_user, only: [:create]

  def index
    set_pickup_category(1,2,3,7)
    set_pickup_brand(1,593,340,58)
  end

  def new
    category_parents = Category.roots
    @category_parents = category_parents.map{|parent| [parent.name]}
    get_category_children if params[:category]
    get_category_grandchildren if params[:category_ancestry]
    get_category_size if params[:category_size]
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to root_path
  end

    #商品の簡易検索を行う
  def search
  end
    #商品の購入確認を行う
  def buy
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :condition_id, :brand_id, :size_id, :prefecture_id, :delivery_fee_burden_id, :delivery_method_id, :delivery_day_id)
  end

  def get_category_children
    category = params[:category]
    category_parents = Category.find_by(name: category)
    @category_children = category_parents.children
    respond_to do |format|
      format.json
    end
  end

  def get_category_grandchildren
    category = params[:category_ancestry]
    category_parents = Category.find_by(id: category)
    @category_children = category_parents.children
    respond_to do |format|
      format.json
    end
  end

  def get_category_size
    category = params[:category_size]
    category_sizes = Category.find_by(id: category)
    @category_sizes = category_sizes.sizes
    respond_to do |format|
      format.json
    end
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
