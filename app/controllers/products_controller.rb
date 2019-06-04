class ProductsController < ApplicationController
    def index
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
        # product.user = current_user
        product.save
        redirect_to root_path
      end

    #商品の簡易検索を行う
    def search
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
end