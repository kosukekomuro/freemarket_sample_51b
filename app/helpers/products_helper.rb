module ProductsHelper
  def product_sort
  @product_sort_selections = [
    ["並び替え", 1],
    ["価格の安い順", 2], 
    ["価格の高い順", 3],
    ["出品の古い順", 4],
    ["出品の新しい順", 5],
    ["いいね!の多い順",6]
  ]
  end

  def category_sort
    @category_selections = [["すべて", 0]]
    category_roots = Category.roots
    
    category_roots.each do |category|
      category_select_input = [category.name, category.id]
      @category_selections << category_select_input
    end

    return @category_selections
  end

  def size_sort
    @size_selections = [["すべて", 0]]
    sizes = SizeEachCategory.all

    sizes.each do |size|
      size_select_input = [size.name, size.id]
      @size_selections << size_select_input
    end

    return @size_selections
  end

  def price_sort 
    @price_sort_selections = [
                                ["選択してください", ""],
                                ["300 ~ 1000", "300 ~ 1000"],
                                ["1000 ~ 5000", "1000 ~ 5000",], 
                                ["5000 ~ 10000", "5000 ~ 10000"],
                                ["10000 ~ 30000", "30000 ~ 50000"],
                                ["50000 ~ ", "50000 ~ "],
                              ]
  end

  def condition_sort
    @condition_selections = [["すべて", 0]]
    conditions = Condition.all

    conditions.each do |condition|
      condition_selection = [condition.condition, condition.id]
      @condition_selections << condition_selection
    end

    return  @condition_selections
  end

  def delivery_burden_sort
    @delivery_burden_selections = [["すべて", 0]]
    delivery_burdens = DeliveryMethod.roots

    delivery_burdens.each do |delivery_burden|
      delivery_burden_selection = [delivery_burden.name, delivery_burden.id]
      @delivery_burden_selections << delivery_burden_selection
    end

    return @delivery_burden_selections
  end

  def sales_status_sort
    @sales_status_selection = [
                                ["すべて", 0],
                                ["販売中", 1],
                                ["売り切れ", 2]
                              ]
  end
end
