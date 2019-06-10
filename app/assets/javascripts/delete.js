$(function(){
  $(document).on('click','.product-showbox-delete', function(e) {
    var res = window.confirm('確認\n削除すると二度と復活できません。\n削除する代わりに停止することもできます。\n\n本当に削除しますか？');
    if( res == true ) {
      var product_id = $('.product-show-wrap').data('product-id');
      var url = `/products/${product_id}`;
      $.ajax({
        url: url,
        type: "DELETE",
        data: { product_id: product_id },
        dataType: 'json',
      })
      .done(function(){
        window.location.href = location.href.replace(/seller_product\.[0-9]+/, "selling_list");
      })
      .fail(function(){
        alert('fail');
      })
    }
  })
})
