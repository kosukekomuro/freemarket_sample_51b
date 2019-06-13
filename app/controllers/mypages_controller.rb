class MypagesController < ApplicationController
  
  def logout
  end

  def myconfirmation
  end

  def show
  end

  def selling_list
    @products = Product.where('(seller_id = ?)', @current_user.id)
  end

  def seller_product
    @product = Product.find(params[:format])
  end

  def likes_list
    @products = @current_user.products
  end

end
