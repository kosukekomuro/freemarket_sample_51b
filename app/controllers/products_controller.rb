class ProductsController < ApplicationController
    def index
    end

    def new
        @category_parents = Category.all.order("id ASC").limit(13)
        @delivery_parents = DeliveryMethod.all.order("id ASC").limit(2)
    end

    #商品の簡易検索を行う
    def search
    end
end
