class CategoriesController < ApplicationController
  def show
    category_ids = Category.search_category_family_ids(params[:id])
    @category_parent = Category.find(params[:id])

    @category_children = @category_parent.children.limit(9)
    @category_children = @category_parent.siblings.limit(9) if @category_children.empty?

    @products = Product.where(category_id: category_ids, buyer_id: nil).limit(1800)
  end

  def get_category_list
    get_category_children(params[:category_parent]) if params[:category_parent]
    get_category_children(params[:category_children]) if params[:category_children]
  end

  private
  def get_category_children(parent_id)
    @category_children = Category.search_category_children(parent_id)
    respond_to do |format|
      format.json { render json: @category_children ,layout: "api/application.jaon.jbuilder"}
    end
  end
end
