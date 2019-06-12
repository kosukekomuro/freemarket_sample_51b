$(function(){
  function addLikesHTML(likes) {
    var html = `<span>いいね！ ${likes.length}</span>`
    return html;
  }
  $(document).on('click','.product-showbox-user-menu__likes', function(e) {
    $('.product-showbox-user-menu__likes--icon').animate({"font-size": "+20px"},250);
    $('.product-showbox-user-menu__likes--icon').animate({"font-size": "+16px"},250);
    $(this).removeClass().addClass("product-showbox-user-menu__already-likes");
    var product_id = $(this).attr('id');
    $.ajax({
      type: 'POST',
      url: '/likes',
      data: { product_id: product_id },
      dataType: 'json'
    })
    .done(function(likes) {
      $(".product-showbox-user-menu__already-likes span").empty();
      $(".product-showbox-user-menu__already-likes").append(addLikesHTML(likes));
    })
    .fail(function() {
      alert('fail');
    })
  })
  $(document).on('click','.product-showbox-user-menu__already-likes', function(e) {
    $(this).removeClass().addClass("product-showbox-user-menu__likes");
    var product_id = $(this).attr('id');
    var url = `/likes/${product_id}`;
    $.ajax({
      type: 'DELETE',
      url: url,
      data: { product_id: product_id },
      dataType: 'json'
    })
    .done(function(likes) {
      $(".product-showbox-user-menu__likes span").empty();
      $(".product-showbox-user-menu__likes").append(addLikesHTML(likes));
    })
    .fail(function() {
      alert('fail');
    })
  })
})
