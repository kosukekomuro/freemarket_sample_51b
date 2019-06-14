( window.onload = function() {
  // 親カテゴリの選択
  $("#sell-parent-category").change(function(){
    $("#sell-child-box").remove();
    $("#sell-grandchild-box").remove();
    $(".sell-size-brand").hide();
    var category = $('option:selected').val();
    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });
      var html = `<div class="sell-select-wrapper", id="sell-child-box">
                    <select name="category_id", id="sell-child-category", class="sell-select-default", required>
                      <option value label="---"></option>
                      ${option}
                    </select>
                    <i class="fas fa-chevron-down"></i>
                   </div>`
      return html;
    };
    $.ajax({
      url: '/products/new',
      type: "GET",
      data:{category: category},
      dataType: 'json'
      })
      .done(function(data){
        var html = buildHTML(data);
        $(".sell-category-select").append(html);
      })
      .fail(function(){
      })
  });
  // 子カテゴリの選択
 $(document).on('change', "#sell-child-category", function(){
    $("#sell-grandchild-box").remove();
    $(".sell-size-brand").hide();
    var category_ancestry = $('#sell-child-category option:selected').val();

    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });
      var html = `<div class="sell-select-wrapper", id="sell-grandchild-box">
                    <select name="category_id", id="sell-grandchild-category", class="sell-select-default", required>
                      <option value label="---"></option>
                      ${option}
                    </select>
                    <i class="fas fa-chevron-down"></i>
                  </div>`
      return html;
    };

    $.ajax({
      url: '/products/new',
      type: "GET",
      data:{category_ancestry: category_ancestry},
      dataType: 'json'
      })
      .done(function(data){
        if(data != ""){
          var html = buildHTML(data);
          $(".sell-category-select").append(html);
        } else {
          $("#sell-grandchild-box").remove();
          $(".sell-size-brand").hide();
        }
      })
      .fail(function(){
      })
  });

  // 孫カテゴリの選択
  $(document).on('change', "#sell-grandchild-category", function(){
      var category_size = $("#sell-grandchild-category").val();
      $(".category").val(category_size);
      function buildHTML(size){
        var option = ``
        size.forEach(function(s){
          option += `<option value="${s.id}">${s.size}</option>`
        });
        var html = `<h3>サイズ<span class="require-form">必須</span></h3>
                    <div class="sell-select-wrapper">
                      <select name="size", class="sell-select-default", id="sell-size-id", required>
                        <option value label="---"></option>
                        ${option}
                      </select>
                      <i class="fas fa-chevron-down"></i>
                    </div>`
          return html;
      };
      $.ajax({
        url: '/products/new',
        type: "GET",
        data:{category_size: category_size},
        dataType: 'json'
      })
      .done(function(data){
        if( data != ""){
            var html = buildHTML(data);
            $(".sell-size-select").empty().append(html);
            $(".sell-size-brand").show();
          } else {
            $(".sell-size-brand").hide();
          }
      })
      .fail(function(){
      })
  });

  // サイズのデータの取得
  $(document).on('change', "#sell-size-id", function(){
    var size_id = $("#sell-size-id").val();
    $(".sell-size").val(size_id);
  });

  // 郵送料の負担による動的なデータの変動
  $("#sell-delivery-burden").on("change", function(){
    $("#sell-delivery-box").remove();
    $("#sell-delivery-title").remove();
    var delivery = $('#sell-delivery-burden option:selected').val();
    function buildHTML(children){
      var option = ``
      children.forEach(function(child){
        option += `<option value="${child.id}">${child.name}</option>`
      });
      var html = `<div class="sell-form-group" id="sell-delivery-title">
                    <h3>配送方法<span class="require-form">必須</span></h3>
                  </div>
                  <div class="sell-select-wrapper", id="sell-delivery-box">
                    <select name="delivery_method_id", id="sell-delivery-method", class="sell-select-default", required>
                      <option value label="---"></option>
                      ${option}
                    </select>
                    <i class="fas fa-chevron-down"></i>
                  </div>`
      return html;
    };
    $.ajax({
      url: '/products/new',
      type: "GET",
      data:{delivery: delivery},
      dataType: 'json'
    })
    .done(function(data){
      if( data != ""){
        var html = buildHTML(data);
        $(".sell-delivery").append(html);
      }
    })
    .fail(function(){
    })
  });

  // 配送方法のidの取得
  $(document).on('change', "#sell-delivery-method", function(){
    var delivery_method_id = $(this).val();
    $(".delivery-method").val(delivery_method_id);
  });

　// 手数料などの計算
  $("#product_price").on("keyup", function(){
    var val = $(this).val();
    if(val >= 300 && val < 10000000){
      $("#list_right_tax").text("");
      $("#list_right_price").text("");
      var tax = val * 0.1
      var price = val * 0.9
      var tax = Math.floor(tax)
      var price = Math.floor(price)
      $("#list_right_tax").append("¥" + tax);
      $("#list_right_price").append("¥" + price);
    }else{
      $("#list_right_tax").text("");
      $("#list_right_price").text("");
      $("#list_right_tax").append("-");
      $("#list_right_price").append("-");
      }
  });

  // ブランドのインクリメンタルサーチ
  $(document).on("keyup", ".sell-brand-input", function(){
    var brand = $.trim($(this).val());
    function buildHTML(brand){
      var search_brand_list = ``
      brand.forEach(function(b){
        search_brand_list += `<li class="sell-search-list">${b.brand}</li>`
      });
      var sellBrandBox = `<div class="sell-search-block">
                            <ul id="sell-search-result">
                              ${search_brand_list}
                            </ul>
                          </div>`
      return sellBrandBox;
    };
    $.ajax({
      url: '/products/new',
      type: 'GET',
      data:{brand: brand},
      dataType: 'json'
    })
    .done(function(data){
      if( data != ""){
        var sellBrandBox = buildHTML(data);
        $(".brand-find-box").append(sellBrandBox);
        $('#sell-search-result').find('li').remove();
      }
    })
    .fail(function(){
    })
  });

  // ブランドのリストをクリックしたらappendされる
  $(document).on('click', ".sell-search-list", function(){
    var search_brand = $(this).text();
    $(".sell-brand-input").val(search_brand);
    $(".sell-search-block").remove();
  });

  // バグの対応
  $(".btn-reload").on("click", function(e){
    e.preventDefault();
    var linkUrl = $(this).attr('href');
    function action() {
      location.href = linkUrl;
    }
    setTimeout(action,50);
  });

　 // モーダルの表示とバリデーション
  $('.sell-form').on('submit', function() {
    if($('#sell-condition').val() == '') {
      alert('商品状態が空欄です！');
      return false;
    }
    else if($('#sell-prefecture').val() == '') {
      alert('発送元の地域が空欄です！');
      return false; 
    }
    else if($('#sell-delivery-day').val() == '') {
      alert('配送までの日数が空欄です！');
      return false; 
    }
    else　{
      $(".sell-modal-box").fadeIn(500);
      $(".modal-overlay").show();
    }
  });
});
