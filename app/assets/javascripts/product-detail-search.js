$(document).on("turbolinks:load", function() {
  const buildDetailSearchResult = data => {
    let html = "";

    if(data.keyword != ""){
      html += `<h2 class = "product-search-result__title">${data.keyword}の検索結果</h2>`;
    }else{
      html += `<h2 class = "product-search-result__title">検索結果</h2>`;
    };

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

      if (product.buyer){
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
                                    ${product.likes}
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
  const buildCategoryChildrenSelect = (categories) =>{
    let selectOption = `<option value="0">すべて</option>`;
    
    categories.forEach((category) => {
      selectOption += `<option value="${category.id}">${category.name}</option>`
    });

    html =  `<div class = "product-detail-search-form-value-category-children">
              <select name="category_sort" id="category_sort" class="product-detail-search-form-value-category-children__select">
                ${selectOption}
              </select>
              <i class="fas fa-chevron-down product-detail-search-form-value-category-children__icon"></i>
            </div>`
    return html;
  };

  //カテゴリーの孫リストをチッェクボックスで作成する
  const buildCategoryGrandChildrenSelect = (categories) => {
      let checkbox = ""

    categories.forEach((category) => {
      checkbox += `<div class = "product-search-category-select-grandchildren">
                    <input type="checkbox" name="category_select${category.id}[category_select][]" id="category_select${category.id}_category_select_" value="${category.id}" class="product-search-category-select-grandchildren__check-box">
                    <label class="product-search-category-select-grandchildren__label" for="category_select${category.id}_category_select_">${category.name}</label>
                   </div>`
    });

    html =  `<div class = "product-detail-search-form-value-category-grandchildren">
              ${checkbox}
             <div>`

    return html
  };

  // 検索するカテゴリーidを返却する。
  const searchCategory = selectCategoryParent => {

    const selectCategoryChild = $('.product-detail-search-form-value-category-children__select').val();
    const selectCategoryGrandchildren = $('[class="product-search-category-select-grandchildren__check-box"]:checked').map(function() {
      return parseInt($(this).val());
    }).get();

    // 孫カテゴリーが選ばれている場合
    if (selectCategoryGrandchildren.length > 0){
      return selectCategoryGrandchildren;
    };
    // 子カテゴリーと孫カテゴリーが選ばれていない場合
    if (selectCategoryGrandchildren.length == 0 && typeof selectCategoryChild === "undefined"){
      return selectCategoryParent;
    };
    // 子カテゴリーのすべてが選ばれている場合
    if (selectCategoryChild == 0 ){
      return selectCategoryParent;
    };
    // 孫カテゴリーが選ばれていない場合(子カテゴリのすべて以外が選択されている場合)
    if (selectCategoryGrandchildren.length == 0){
      return selectCategoryChild;
    };
  };

  //サイズの選択技をチッェクボックスで作成する
  const buildSizeSelect = (sizes) => {
    let checkbox = ""

    sizes.forEach((size) => {
      checkbox += `<div class = "product-search-size-select">
                    <input type="checkbox" name="category_select${size.id}[size_select][]" id="size_select${size.id}_size_select_" value="${size.id}" class="product-search-size-select__check-box">
                    <label class="product-search-size-select__label" for="size_select${size.id}_size_select_">${size.name}</label>
                  </div>`
    });

    html =  `<div class = "product-detail-search-form-value-size-checkbox">
              ${checkbox}
            <div>`

    return html
  };

  const detailSearch = () =>{
    const url = "/products/detail_search";
    const selectedSort = $('option:selected').val();
    const searchKeyword = $('.product-detail-search-form-value-keyword__input').val();
    const selectedCategory = searchCategory($('.product-detail-search-form-value-category__select').val());
    const searchBrand = $('.product-detail-search-form-value-brand__input').val();
    const selectedSize = $('[class="product-search-size-select__check-box"]:checked').map(function() {
      return parseInt($(this).val());
    }).get();
    const searchPriceMin = $('.product-detail-search-form-value-price-min').val();
    const searchPriceMax = $('.product-detail-search-form-value-price-max').val();
    const selectedCondition = $('[class="product-search-condition-select__check-box"]:checked').map(function() {
      return parseInt($(this).val());
    }).get();
    const selectedDeliveryBurden = $('[class="product-search-delivery-burden-select__check-box"]:checked').map(function() {
      return parseInt($(this).val());
    }).get();
    const selectedSalusStatus = $('[class="product-search-sales-status-select__check-box"]:checked').map(function() {
      return parseInt($(this).val());
    }).get();

    $.ajax({
      url: url,
      type: "GET",
      data: {selected_sort: selectedSort,
             search_keyword: searchKeyword,
             selected_category: selectedCategory,
             search_brand: searchBrand,
             selected_size: selectedSize,
             search_price_min: searchPriceMin,
             search_price_max: searchPriceMax,
             selected_condition: selectedCondition,
             selected_delivery_burden: selectedDeliveryBurden,
             selected_salus_status: selectedSalusStatus},
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
  };

  //全チェックボックスのチェックを操作する
  //すべてが選択された場合、全チェックボックスをチェックする。(反対もしかり)
  const operateTotalCheckbox = element =>{
    const elementClass ='input[class=' + element.attr('class')

    if ( element.is(':checked') ){
      $(elementClass).prop("checked",true);
    }else{
      $(elementClass).prop("checked",false);
    }
  };

  //チェックボックスの選択技ですべての選択技のチェック判定を行う。
  const decisionAllcheck = element =>{
    const elementClass = element.attr('class')
    const checkboxLength = $(`.${elementClass}`).length
    const elementId = element.attr('id')
    const elementIdString = (elementId).replace(/\d+/, '');
    let checkFlag = true;
    let checkElementId;

    for(let i=1; i<checkboxLength; i++) {
      checkElementId = elementIdString + i.toString();

      if( !$(`input[id=${checkElementId}`).is(':checked') ){
        checkFlag = false;
      };
    };

    if(checkFlag){
      $(`input[id= ${elementIdString}` + "0").prop("checked", true);
    }else{
      $(`input[id= ${elementIdString}` + "0").prop("checked", false);
    };
  };

  //ブランドの検索結果のhtmlを作成する
  const bildBrandListHTML = brandList =>{
    let html = ``;

    brandList.forEach((brand) => {
      html += `<li class="products-search-brand-result__list">${brand.brand}</li>`
    });

    return html
  };

  // 並び替えの選択時に発火
  // 商品を再建策後、選択された並び順に並び替えて表示する
  $('.product-detail-search-form-sort__select').on('change', () =>{
    detailSearch();
  });

  //実行ボタンクリック時に発火
  $('.product-detail-search-form-btn__execution').on('click', () =>{
    detailSearch();
  });

  //クリアボタン押下時に発火
  $('.product-detail-search-form-btn__clear').on('click', () =>{
    $(".product-detail-search-form")[0].reset();
    $('.product-detail-search-form-value-category-children').remove();
    $('.product-detail-search-form-value-category-grandchildren').remove();
    $('.product-detail-search-form-value-size-checkbox').remove();
    $(".products-search-brand-result").empty();
    $(".product-search-condition-select__check-box").prop("checked",false);
    $(".product-search-delivery-burden-select__check-box").prop("checked",false);
    $(".product-search-sales-status-select__check-box").prop("checked",false);
  });

  //選択された親カテゴリーから子カテゴリーの選択技を作成する。
  $('.product-detail-search-form-value-category__select').on('change', (e) =>{
    $('.product-detail-search-form-value-category-children').remove();
    $('.product-detail-search-form-value-category-grandchildren').remove();

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

  //選択された子カテゴリーから孫カテゴリーの選択技を作成する。
  $(document).on('change', '.product-detail-search-form-value-category-children__select', (e) =>{
    $('.product-detail-search-form-value-category-grandchildren').remove();

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
        const html = buildCategoryGrandChildrenSelect(data);
        $('.product-detail-search-form-value-category-children').after(html);
      })
      .fail(function(){
        alert('通信に失敗しました。再度読み込んでください');
      });
    };
  });

  // 選択されたサイズの選択技をチェックボックスで作成する
  $('.product-detail-search-form-value-size__select').on('change', (e) =>{
    $('.product-detail-search-form-value-size-checkbox').remove();
    
    const selectedSizeEachCategoryId = $(e.currentTarget).val();
    const url = "/products/create_search_selection";

    if (selectedSizeEachCategoryId != "0"){
      $.ajax({
        url: url,
        type: "GET",
        data: {size_each_category_id: selectedSizeEachCategoryId},
        dataType: 'json',
      })
      .done(function(data){
        const html = buildSizeSelect(data);
        $('.product-detail-search-form-value-size').after(html);
      })
      .fail(function(){
        alert('通信に失敗しました。再度読み込んでください');
      });
    };
  });
  // 選択された値段を表示する作成する。
  $('.product-detail-search-form-value-price__select').on('change', (e) =>{
    const selectedPrice = $(e.currentTarget).val();
    const displayPrice = selectedPrice.split(" ");
    
    $('.product-detail-search-form-value-price-min').val(displayPrice[0]);
    $('.product-detail-search-form-value-price-max').val(displayPrice[2]);
  });

  //商品の状態チェックボックスですべてを選んだ時
  $('#condition_select_0').on('click', (e) => {
    operateTotalCheckbox($(e.currentTarget));
  });

  //配送料金の負担チェックボックスですべてを選んだ時
  $('#burden_0').on('click', (e) => {
    operateTotalCheckbox($(e.currentTarget));
  });

  //配送料金の負担チェックボックスですべてを選んだ時
  $('#sales-status_0').on('click', (e) => {
    operateTotalCheckbox($(e.currentTarget));
  });

  //商品の状態チェックボックスがチェックされた時発火
  $('.product-search-condition-select__check-box').on('click', (e) => {
    decisionAllcheck($(e.currentTarget));
  });

  //配送料の負担チェックボックスがチェックされた時発火
  $('.product-search-delivery-burden-select__check-box').on('click', (e) => {
    decisionAllcheck($(e.currentTarget));
  });

  //販売状況チェックボックスがチェックされた時発火
  $('.product-search-sales-status-select__check-box').on('click', (e) => {
    decisionAllcheck($(e.currentTarget));
  });

  // ブランドのインクリメンタルサーチ
  $('.product-detail-search-form-value-brand__input').on('keyup', (e) => {
    const brand = $(e.currentTarget).val();
    $(".products-search-brand-result").empty();
    if(brand !== ""){

      $.ajax({
        url: '/products/new',
        type: 'GET',
        data:{brand: brand},
        dataType: 'json'
      })
      .done(function(brandList){
        html = bildBrandListHTML(brandList);
        $(".products-search-brand-result").append(html);
      })
      .fail(function(){
        alert('通信に失敗しました。再度読み込んでください');
      })
    };
  });
  // ブランドを選択した時、ブランド欄に表示する。
  $(document).on('click', '.products-search-brand-result__list', (e) =>{
    const brand = $(e.currentTarget).text();
    $(".product-detail-search-form-value-brand__input").val(brand);
    $(".products-search-brand-result").empty();
  });
});
