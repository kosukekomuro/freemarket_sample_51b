$(function(){
  function addLikesHTML(likes) {
    var html = `<span>いいね！ ${likes.length}</span>`
    return html;
  }
  $(document).on('click','.product-showbox-user-menu__likes', function(e) {
    var product_id = $(this).attr('id');
    $.ajax({
      type: 'POST',
      url: '/likes',
      data: { product_id: product_id },
      dataType: 'json'
    })
    .done(function(likes) {
      if(likes.length != 'error'){
        $('.product-showbox-user-menu__likes--icon').animate({"font-size": "+20px"},250);
        $('.product-showbox-user-menu__likes--icon').animate({"font-size": "+16px"},250);
        $('.product-showbox-user-menu__already-likes--icon').animate({"font-size": "+20px"},250);
        $('.product-showbox-user-menu__already-likes--icon').animate({"font-size": "+16px"},250);
        $('.product-showbox-user-menu__likes').removeClass().addClass("product-showbox-user-menu__already-likes");
        $(".product-showbox-user-menu__already-likes span").remove();
        $(".product-showbox-user-menu__already-likes").append(addLikesHTML(likes));
      }
    })
    .fail(function() {
      alert('fail');
    })
  })
  $(document).on('click','.product-showbox-user-menu__already-likes', function(e) {
    var product_id = $(this).attr('id');
    var url = `/likes/${product_id}`;
    $.ajax({
      type: 'DELETE',
      url: url,
      data: { product_id: product_id },
      dataType: 'json'
    })
    .done(function(likes) {
      $('.product-showbox-user-menu__already-likes').removeClass().addClass("product-showbox-user-menu__likes");
      $(".product-showbox-user-menu__likes span").remove();
      $(".product-showbox-user-menu__likes").append(addLikesHTML(likes));
    })
    .fail(function() {
      alert('fail');
    })
  })
})
