class ProductsController < ApplicationController

  before_action :set_product, only: [:buy, :pay, :show]

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

    render layout: "sellproduct"
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
    render layout: "sellproduct"
  end

  def pay
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: @current_user.card_id,
      currency: 'jpy',
    )
    redirect_to action: :index
  end

  def show
    @user_products = Product.where('(seller_id = ?) AND (id != ?)', @product.seller_id, @product.id).limit(6)
    @brand_category_products = Product.where('(brand_id = ?) AND (category_id = ?) AND (id != ?)', @product.brand_id, @product.category_id, @product.id).limit(6)
    @previous_product = Product.where('(id < ?)', @product.id).order("id DESC").first
    @next_product = Product.where('(id > ?)', @product.id).order("id ASC").first
  end

  def destroy
    # binding.pry
    respond_to do |format|
      format.json{
        product = Product.find(params[:product_id])
        product.delete
      }
    end
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

  def set_pickup_category(first, second, third, fourth)
    @category_id = []
    @category_first = Category.find(first)
    @category_id << @category_first.id
    @category_first.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_first_items = Product.where(category_id: @category_id)

    @category_id = []
    @category_second = Category.find(second)
    @category_id << @category_second.id
    @category_second.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_second_items = Product.where(category_id: @category_id)

    @category_id = []
    @category_third = Category.find(third)
    @category_id << @category_third.id
    @category_third.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_third_items = Product.where(category_id: @category_id)

    @category_id = []
    @category_fourth = Category.find(fourth)
    @category_id << @category_fourth.id
    @category_fourth.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_fourth_items = Product.where(category_id: @category_id)
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
    @product = Product.find(params[:id])
  end

end
