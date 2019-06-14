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
    delivery_parents = DeliveryMethod.roots
    @delivery_parents = delivery_parents.map{|delivery| [delivery.name]}
    get_delivery_children if params[:delivery]
    get_brand_list if params[:brand]
    @product = Product.new
    render layout: "sellproduct"
  end

  def create
    @product = Product.new(product_params)
    @product_brand = Brand.find_or_create_by(brand: params[:product][:brand])
    @product.brand_id = @product_brand.id
    if @product.save
      params[:images]['url'].map do |a|
        @image = @product.images.create!(url: a)
      end
    else
      category_parents = Category.roots
      @category_parents = category_parents.map{|parent| [parent.name]}
      delivery_parents = DeliveryMethod.roots
      @delivery_parents = delivery_parents.map{|delivery| [delivery.name]}
      
      render :new, layout: "sellproduct"
    end
  end

  def search
    @products = Product.where("name LIKE ?", "%#{params[:keyword]}%").limit(4800)
  end

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
    if @product.seller_id == current_user.id
      redirect_to seller_product_mypages_path(format: params[:id])
    else
      @user_products = Product.users(@product.seller_id, @product.id)
      @brand_category_products = Product.brands(@product.brand_id, @product.category_id, @product.id)
      @previous_product = Product.previous(@product.id)
      @next_product = Product.next(@product.id)
    end
  end

  def destroy
    respond_to do |format|
      format.json{
        product = Product.find(params[:product_id])
        product.delete
      }
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, :condition_id, :size_id, :brand_id, :prefecture_id, :delivery_method_id, :delivery_day_id).merge(seller_id: @current_user.id, trading_evaluation_id: 1, status_id: 1)
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

  def get_delivery_children
    delivery = params[:delivery]
    delivery_parents = DeliveryMethod.find_by(name: delivery)
    @delivery_children = delivery_parents.children
    respond_to do |format|
      format.json
    end
  end

  def get_brand_list
    @brand_names = Brand.where('brand LIKE(?)', "%#{params[:brand]}%")
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
