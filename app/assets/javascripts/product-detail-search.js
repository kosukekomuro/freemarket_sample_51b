$(document).on("turbolinks:load", function() {
  const buildDetailSearchResult = data => {

    let html = `<h2 class = "product-search-result__title">${data.keyword}の検索結果</h2>`;

    if (data.reseltCount > 0){
      html += `<p class = "product-search-result__count">1 - ${data.products.length}件表示<p>`;

    }else if(data.reseltCount == 0){
      html += `<p class = "product-search-result__count">該当する商品が見つかりません。条件を変えて再度お試しください。</p>
               <h2 class = "product-search-result__subtitle">新着商品</h2>`;
    };

    let productListHtml = "";
    
    data.products.forEach((product)=> {
      let link = "/products/" + product.id;
      let productInfoHtml = "";

      if(product.buyer == 0){
        productInfoHtml += `<div class = "product-search-result-item__sold">
                              <div class = "product-search-result-item__sold--msg">
                                SOLD
                              </div>
                            </div>`;
      };

      productInfoHtml += `<div class="product-search-result-item-info">
                            <div class="product-search-result-item-info__name">${product.name}</div>
                            <div class="product-search-result-item-info-price">
                              <p class="product-search-result-item-info-price__main">
                                ¥ ${product.price}
                                <span class="product-search-result-item-info-price__main">
                                  <i class="fa fa-heart product-search-result-item-info-price__main--icon-red"></i>
                                  <span class="product-search-result-item-info-price__main--evaluation">
                                    ${product.evaluation}
                                  </span>
                                </span>
                              </p>
                              <p class="product-search-result-item-info-price__sub">
                              (税込)
                              </p>
                            </div>
                          </div>`;

        productListHtml += `<a href = " ${link}", class = "product-search-result-item__link", value = "${product.id}">
                              <img class = "product-search-result-item__img" src="${product.image.url}">
                              ${productInfoHtml}
                            </a>`;
    });

    html += `<div class = "product-search-result-item">
              ${productListHtml}
            </div>`

    return html
  };

  //カテゴリーの子リストを作成する
  const buildCategoryChildrenSelect = (categories, related) =>{
    let selectOption = `<option value="0">すべて</option>`;
    
    categories.forEach((category) => {
      selectOption += `<option value="${category.id}">${category.name}</option>`
    });

    html =  `<div class = "product-detail-search-form-value-category-${related}">
              <select name="category_sort" id="category_sort" class="product-detail-search-form-value-category-${related}__select">
                ${selectOption}
              </select>
              <i class="fas fa-chevron-down product-detail-search-form-value-category-${related}__icon"></i>
            </div>`
    return html;
  };

  // 並び替えの選択時に発火
  // 商品を再建策後、選択された並び順に並び替えて表示する
  $('.product-detail-search-form-sort__select').on('change', () =>{
    
    const url = "/products/detail_search";
    const selectedSort = $('option:selected').val();
    const searchKeyword = $('.product-detail-search-form-value-keyword__input').val();

    $.ajax({
      url: url,
      type: "GET",
      data: {selected_sort: selectedSort,
             search_keyword: searchKeyword},
      dataType: 'json',
    })
    .done(function(data){
      const html = buildDetailSearchResult(data);
      $('.product-search-result').empty();
      $('.product-search-result').append(html);
    })
    .fail(function(){
      alert('通信に失敗しました。再度読み込んでください');
    });
  });

  //選択された親カテゴリーから子カテゴリーの選択技を作成する。
  $('.product-detail-search-form-value-category__select').on('change', (e) =>{

    $('.product-detail-search-form-value-category-children').remove();
    $('.product-detail-search-form-value-category-grand-children').remove();

    const selectedCategoryId = $(e.currentTarget).val();
    const url = "/categories/get_category_list";

    if (selectedCategoryId != "0"){
      $.ajax({
        url: url,
        type: "GET",
        data: {category_parent: selectedCategoryId},
        dataType: 'json',
      })
      .done(function(data){
        const html = buildCategoryChildrenSelect(data, "children");
        $('.product-detail-search-form-value-category').after(html);
      })
      .fail(function(){
        alert('通信に失敗しました。再度読み込んでください');
      });
    };
  });

  //選択された親カテゴリーから子カテゴリーの選択技を作成する。
  $(document).on('change', '.product-detail-search-form-value-category-children__select', (e) =>{
    $('.product-detail-search-form-value-category-grand-children').remove();

    const selectedCategoryId = $(e.currentTarget).val();
    const url = "/categories/get_category_list";

    if (selectedCategoryId != "0"){
      $.ajax({
        url: url,
        type: "GET",
        data: {category_parent: selectedCategoryId},
        dataType: 'json',
      })
      .done(function(data){
        const html = buildCategoryChildrenSelect(data, "grand-children");
        $('.product-detail-search-form-value-category-children').after(html);
      })
      .fail(function(){
        alert('通信に失敗しました。再度読み込んでください');
      });
    };
  });
});
