module ProductsHelper
  def product_sort
  @product_sort_selection = [
    ["並び替え", 1],
    ["価格の安い順", 2], 
    ["価格の高い順", 3],
    ["出品の古い順", 4],
    ["出品の新しい順", 5],
    ["いいね!の多い順",6]
  ]
  end

  def category_sort
    @categories_selection = [["すべて", 0]]
    category_roots = Category.roots
    
    category_roots.each do |category|
      category_select_input = [category.name, category.id]
      @categories_selection << category_select_input
    end

    return @categories_selection
  end

  def size_sort
    @sizes_selection = [["すべて", 0]]
    sizes = SizeEachCategory.all

    sizes.each do |size|
      size_select_input = [size.name, size.id]
      @sizes_selection << size_select_input
    end

    return @sizes_selection
  end

  def price_sort 
    @price_sort_selection = [
                                ["選択してください", 0],
                                ["300 ~ 1000", "300 ~ 1000"],
                                ["1000 ~ 5000", "1000 ~ 5000",], 
                                ["5000 ~ 10000", "5000 ~ 10000"],
                                ["10000 ~ 30000", "30000 ~ 50000"],
                                ["50000 ~ ", "50000 ~ "],
                              ]
  end


  def condition_sort
    @conditions_selection = Condition.all
  end

  def delivery_burden_sort
    @delivery_burden = DeliveryMethod.select(:name).distinct
  end

  def sales_status_sort
    @sales_status_selection = [
                                "販売中",
                                "売り切れ"
                              ]
  end
end
