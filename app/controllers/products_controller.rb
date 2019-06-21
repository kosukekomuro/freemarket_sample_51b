class ProductsController < ApplicationController

  before_action :set_product, only: [:buy, :pay, :show, :edit, :update]

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
    @keyword = params[:keyword]
    @products = Product.where("name LIKE ?", "%#{params[:keyword]}%").limit(4800)
    @result_count = @products.length
    @products = Product.all.order(updated_at: "DESC").limit(36) if @products.length == 0 || !@keyword.present?
  end

  def detail_search
    @keyword = params[:search_keyword]
    @products =  Product.detail_search(@keyword, 
                                        params[:selected_category], 
                                        params[:search_brand], 
                                        params[:selected_size],
                                        params[:search_price_min],
                                        params[:search_price_max],
                                        params[:selected_condition],
                                        params[:selected_delivery_burden],
                                        params[:selected_salus_status],
                                        params[:selected_sort])

    @result_count = @products.length
    @products = Product.all.order(id: "DESC").limit(36) if @result_count == 0

    respond_to do |format|
      format.json
    end
  end

  def create_search_selection
    @sizes = size_selection(params[:size_each_category_id]) if params[:size_each_category_id]

    respond_to do |format|
      format.json
    end
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
    @product.buyer_id = @current_user.id
    @product.save
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

  def edit
    category_parents = Category.roots
    @category_parents = category_parents.map{|parent| [parent.name]}
    category_children = Category.find_by(name: @product.category.parent.parent.name).children
    @category_children = category_children.map{|children| [children.name, children.id]}
    category_grand_children = Category.find_by(id: @product.category.parent.id).children
    @category_grand_children = category_grand_children.map{|grand_children| [grand_children.name, grand_children.id]}
    
    category_sizes = Category.find_by(id: @product.category.id).sizes
    @category_sizes = category_sizes.map{|size| [size.size, size.id]}
    
    delivery_parents = DeliveryMethod.roots
    @delivery_parents = delivery_parents.map{|delivery| [delivery.name]}
    @delivery_children = @product.delivery_method.parent.children.map{|delivery_child| [delivery_child.name]}
  
    get_brand_list if params[:brand]
    @sale_commission = (0.1 * @product.price).round
    @images_length = Image.where('(product_id = ?)', params[:id]).length

    render layout: "sellproduct"
  end

  def update    
    @product_brand = Brand.find_or_create_by(brand: params[:product][:brand])
    @product.brand_id = @product_brand.id
    if Category.find(params[:product][:category_id]).category_sizes.length == 0
      params[:product][:size_id] = nil
    end 
    
    if @product.update(product_params)  
      if params[:images] != nil
        params[:images]['url'].map do |a|
          if a != "null"
            @image = @product.images.create!(url: a)
          end
        end
      end
    else
      category_parents = Category.roots
      @category_parents = category_parents.map{|parent| [parent.name]}
      delivery_parents = DeliveryMethod.roots
      @delivery_parents = delivery_parents.map{|delivery| [delivery.name]}   
      render :new, layout: "sellproduct"
    end
  end

  def delete
    Image.find(params[:id]).delete
    respond_to do |format|
      format.json{}
    end
  end

  def image
    @images = Image.where('(product_id = ?)', params[:id]).length
    respond_to do |format|
      format.json{}
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
    @category_first_items = Product.where(category_id: @category_id).order("id DESC").limit(4)
    @category_id = []
    @category_second = Category.find(second)
    @category_id << @category_second.id
    @category_second.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_second_items = Product.where(category_id: @category_id).order("id DESC").limit(4)

    @category_id = []
    @category_third = Category.find(third)
    @category_id << @category_third.id
    @category_third.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_third_items = Product.where(category_id: @category_id).order("id DESC").limit(4)

    @category_id = []
    @category_fourth = Category.find(fourth)
    @category_id << @category_fourth.id
    @category_fourth.children.each do |child|
      @category_id << child.id
      child.children.each do |grand_child|
        @category_id << grand_child.id
      end
    end
    @category_fourth_items = Product.where(category_id: @category_id).order("id DESC").limit(4)
  end

  def set_pickup_brand(first, second, third, fourth)
    @brand_first = Brand.find(first)
    @brand_first_items = Product.where(brand_id: first).order("id DESC").limit(4)

    @brand_second = Brand.find(second)
    @brand_second_items = Product.where(brand_id: second).order("id DESC").limit(4)

    @brand_third = Brand.find(third)
    @brand_third_items = Product.where(brand_id: third).order("id DESC").limit(4)

    @brand_fourth = Brand.find(fourth)
    @brand_fourth_items = Product.where(brand_id: fourth).order("id DESC").limit(4)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def size_selection(search_size)
    size_each_category = SizeEachCategory.find(search_size)
    sizes = []

    size_each_category.size_each_category_sizes.each do |size_each_category_size|
      size = {name: size_each_category_size.size.size , id: size_each_category_size.size.id }
      sizes << size
    end

    return sizes
  end
end
