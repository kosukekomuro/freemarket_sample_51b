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

    #商品の詳細情報の表示を行う
    def show
    end

    #商品の購入確認を行う
    def buy
    end
end
