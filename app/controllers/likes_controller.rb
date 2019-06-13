class LikesController < ApplicationController
  def create
    if Like.create(user_id: @current_user.id, product_id: params[:product_id])
      @likes = Product.find(params[:product_id]).likes.length
    else
      @likes = 'error'
    end
    respond_to do |format|
      format.json{}
    end
  end

  def destroy
    Like.find_by(user_id: @current_user.id, product_id: params[:product_id]).delete
    @likes = Product.find(params[:product_id]).likes.length
    respond_to do |format|
      format.json{}
    end
  end
end
