$(function() {
  $('.main-slick-image').slick({
    prevArrow:'<i class="fa fa-angle-left slide-arrow prev-arrow"></i>',
    nextArrow:'<i class="fa fa-angle-right slide-arrow next-arrow"></i>',
    dots: true,
    autoplay: true,
    autoplaySpeed: 4000,
    speed: 800
  });

  const productShowSlider = ".product-showbox-contents-slick__main-image"; // スライダー
  const productShowthumbnailItem = ".product-showbox-contents-slick__thumbnail-image--size"; // サムネイル画像アイテム

  // サムネイル画像アイテムに data-index でindex番号を付与
  $(productShowthumbnailItem).each(function(){
   let index = $(productShowthumbnailItem).index(this);
   $(this).attr("data-index",index);
  });

  // スライダー初期化後、カレントのサムネイル画像にクラス「thumbnail-current」を付ける
  // 「slickスライダー作成」の前にこの記述を書く
  $(productShowSlider).on('init',function(slick){
   let index = $(".slide-item.slick-slide.slick-current").attr("data-slick-index");
   $(productShowthumbnailItem+'[data-index="'+index+'"]').addClass("thumbnail-current");
  });

  //slickスライダー初期化
  $(productShowSlider).slick({
    arrows: false,
    fade: true,
    infinite: false
  });

  //初期遷移時、index=0のサムネイルにクラス名(thumbnail-current)を追加
  $(productShowthumbnailItem+'[data-index="'+ 0 +'"]').addClass("thumbnail-current");

  //サムネイル画像アイテムをクリックしたときにスライダー切り替え
  $(productShowthumbnailItem).on('mouseover',function(){
    let index = $(this).attr("data-index");
    $(productShowSlider).slick("slickGoTo",index,false);
  });
  
  //サムネイル画像のカレントを切り替え
  $(productShowSlider).on('beforeChange',function(event,slick, currentSlide,nextSlide){
    $(productShowthumbnailItem).each(function(){
      $(this).removeClass("thumbnail-current");
    });
    $(productShowthumbnailItem+'[data-index="'+nextSlide+'"]').addClass("thumbnail-current");
  });
});
