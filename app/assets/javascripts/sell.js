$(document).on("turbolinks:load", function() {
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
                    <select name="category_id" id="sell-child-category", class="sell-select-default">
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
                    <select name="category_id" id="sell-grandchild-category", class="sell-select-default">
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
                      <select name="size", class="sell-select-default">
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
  $("#sell-delivery-burden").on("change", function(){
    var burden = $('#sell-delivery-burden option:selected').val();
    if(burden == "送料込み(出品者負担)"){
        $("#seller-burden").show();
        $("#buyer-burden").hide();
    } else if(burden == "着払い(購入者負担)"){
        $("#buyer-burden").show();
        $("#seller-burden").hide();
    } else {
        $("#seller-burden").hide();
        $("#buyer-burden").hide();
    }
});
  $("#product_price").on("keyup", function(){
    var val = $(this).val();
    if(val >= 300 && isFinite(val)){
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
  $(".btn-reload").on("click", function(e){
    e.preventDefault();
    var linkUrl = $(this).attr('href');
    function action() {
      location.href = linkUrl;
    }
    setTimeout(action,50);
  });
});
