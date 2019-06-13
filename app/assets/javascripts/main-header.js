$(document).on("turbolinks:load", function() {

  const url = "/categories/get_category_list";

  // カテゴリーの親idから子リストの作成
  const buildHeaderCategoryChildrenList = children =>{
    let html = "";

    children.forEach((child) => {
      let link = "/categories/" + child.id;

      html += `<li class = "header-product-nav-child__list">
                <a href = " ${link}", class = "header-product-nav-child__list--button", value = "${child.id}">
                  ${child.name}
                </a>
                <ul class = "header-product-nav-grand-child">
                </ul>
              </li>`
      });
    return html;
  };

  const buildHeaderCategoryGrandChildrenList = grandchildren =>{
    let html = "";
    
    grandchildren.forEach((grandchild) => {
      let link = "/categories/" + grandchild.id;

      html += `<li class = "header-product-nav-grand-child__list">
                <a href = " ${link}", class = "header-product-nav-grand-child__list--button", value = "${grandchild.id}">
                  ${grandchild.name}
                </a>
              </li>`
      });
    return html;
  };

  // ヘッダーで選択されたカテゴリー親から子リストを作成する。
  $('.header-product-nav-parent__list--button').on('mouseover', function(){
    // リストの中身を初期化
    $('.header-product-nav-child').empty();
    $('.header-product-nav-parent__list--button').css({'color':'#333', 'background-color':'white'});

    $(this).css({'color':'#fff', 'background-color':'#ea352d'});
    const data = $(this).attr('value');
    
    $.ajax({
      url: url,
      type: "GET",
      data: {category_parent: data},
      dataType: 'json'
    })
    .done(function(data){
      const html = buildHeaderCategoryChildrenList(data);
      $('.header-product-nav-child').append(html);
    })
    .fail(function(){
      alert('通信に失敗しました。再度読み込んでください');
    })
  })

  // ヘッダーで選択された親と子からカテゴリーの孫リストを作成する。
  $(document).on("mouseover", ".header-product-nav-child__list--button", function () {
    $('.header-product-nav-grand-child').empty();
    $('.header-product-nav-child__list--button').css({'color':'#333', 'background-color':'white'});

    $(this).css({'background-color':'#eee'});

    const data = $(this).attr('value');
    
    $.ajax({
      url: url,
      type: "GET",
      data: {category_children: data},
      dataType: 'json',
    })
    .done(function(data){
      const html = buildHeaderCategoryGrandChildrenList(data);
      $('.header-product-nav-grand-child').append(html);
    })
    .fail(function(){
      alert('通信に失敗しました。再度読み込んでください');
    })
  })
  $(document).on("mouseover", ".header-product-nav-grand-child__list--button", function () {
    $('.header-product-nav-grand-child__list--button').css({'color':'#333', 'background-color':'white'})

    $(this).css({'background-color':'#eee'});
  });
});
