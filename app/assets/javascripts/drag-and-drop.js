$(document).on('turbolinks:load', function(){
  if(location.href.match(/products\/[0-9]+\/edit/)){
    var product_id = $('.sellbox').attr('id');
    $.ajax({
      url: '/products/image',
      type: "GET",
      data: { id: product_id },
      dataType: 'json',
    }) 
    .done(function(length){
      for (var i=0; i<length.length; i++) {
        files_array.push(null);
      }
    })
  }
  function buildImage(loadedImageUri){
    // srcに""をつけることにより無事写真の取得に成功
    var imageBuild = `<div class="sell-image-list">
                        <figure class="image-mam">
                          <img src="${loadedImageUri}" class="sell-image-orig"/>
                        </figure>
                        <div class="display-link-image">
                          <a class="sell-upload-btn border-right image-edit-btn">編集</a>
                          <a class="sell-upload-btn image-delete-btn">削除</a>
                        </div>
                      </div>`
    return imageBuild;
  }

  var dropSub = `<label id='image_file_filed' class='drop_area' for="upload-image">
                   <div class="sell-dropbox__upload">
                     <p class="sell-dropbox__text-sub">
                       ドラックアンドドロップ<br>またはクリックしてファイルをアップロード
                     </p>
                     <input type="file" name="image" class="sell-item_image upload-image" id="upload-image" multiple="true">
                   </div>
                 </label>`

  var files_array = []

  $('.sell-dropbox__upload').on('dragover',function(e){
    e.preventDefault();
  });

  $('.sell-dropbox__upload').on('drop',function(event){
    event.preventDefault();
      // 何故か、dataTransferがうまくいかなかったので、originalEventから読み込んでいます。
      // ここで、イベントによって得たファイルを配列で取り込んでいます。
    files = event.originalEvent.dataTransfer.files;
      // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
    for (var i=0; i<files.length; i++) {
      files_array.push(files[i]);
      var fileReader = new FileReader();
      // ファイルが読み込まれた際に、行う動作を定義する。
      fileReader.onload = function(e) {
      // 画像のurlを取得します。
        var imageUrl = e.target.result;
      // 取得したURLを利用して、ビューにHTMLを挿入する。
        var count_image = files_array.length
        var less_width = $('.dropzone').css('width',$('.dropzone').width()-128)
        if (count_image == 9){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('.dropzone').css('width', "130px");
          $(".sell-dropbox__text").css("top", "5%");
        }
        else if (count_image > 10) {
          files_array.pop();
          $(".error-image").text("10枚以上の画像のアップロードはできません"); 
          $(".error-image").css("color", "red"); 
        }
        else if (count_image == 10){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('.dropzone').hide();
        }
        else if (count_image == 4){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').show();
          $("#preview-sub").append(dropSub);
          less_width
          $('.dropzone').css('width', "100%");
        }
        else if ( count_image == 5){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('.dropzone').css('width', "100%");
          $('#preview-sub').hide();
        }
        else if ( 0 < count_image && count_image < 4 ){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          less_width
        }
        else if ( count_image == 6 ) {
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').hide();
          $('.dropzone').css('width', "510px");
        }
        else if ( count_image == 7 ) {
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').hide();
          $('.dropzone').css('width', "380px");
        } 
        else {
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').hide();
          $('.dropzone').css('width', "250px");
        }
      };
      // ファイルの読み込みを行う。iにしてあげることでファイル数分読み込みを行う
      fileReader.readAsDataURL(files[i]);
    }
  });

  // changeイベントでのイベントの検知
  $(document).on('change', '.upload-image', function(){
    var files = $('.upload-image').prop('files');
      // 画像のファイルを一つづつ、先ほどの画像管理用の配列に追加する。
    for (var i=0; i<files.length; i++) {
      files_array.push(files[i]);
      var fileReader = new FileReader();
      // ファイルが読み込まれた際に、行う動作を定義する。
      fileReader.onload = function(e) {
      // 画像のurlを取得します。
        var imageUrl = e.target.result;
      // 取得したURLを利用して、ビューにHTMLを挿入する。
        var count_image = files_array.length
        var less_width = $('.dropzone').css('width',$('.dropzone').width()-128)
        if (count_image == 9){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('.dropzone').css('width', "130px");
          $(".sell-dropbox__text").css("top", "5%");
        }
        else if (count_image > 10) {
          files_array.pop();
          $(".error-image").text("10枚以上の画像のアップロードはできません"); 
          $(".error-image").css("color", "red"); 
        }
        else if (count_image == 10){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('.dropzone').hide();
        }
        else if (count_image == 4){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').show();
          $("#preview-sub").append(dropSub);
          less_width
          $('.dropzone').css('width', "100%");
        }
        else if ( count_image == 5){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('.dropzone').css('width', "100%");
          $('#preview-sub').hide();
        }
        else if ( 0 < count_image && count_image < 4 ){
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          less_width
        }
        else if ( count_image == 6 ) {
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').hide();
          $('.dropzone').css('width', "510px");
        }
        else if ( count_image == 7 ) {
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').hide();
          $('.dropzone').css('width', "380px");
        } 
        else {
          var html = buildImage(imageUrl);
          $(".sell-image-display").prepend(html);
          $('#preview-sub').hide();
          $('.dropzone').css('width', "250px");
        }
      };
      // ファイルの読み込みを行う。iにしてあげることでファイル数分読み込みを行う
      fileReader.readAsDataURL(files[i]);
    }
  });

  // div配下のaタグがクリックされた際に、イベントを発生させる。
  $(document).on('click','.image-delete-btn', function(){
  // index関数を利用して、クリックされたaタグが、div内で何番目のものか特定する。
    var index = $(".image-delete-btn").index(this);
  // クリックされたaタグの順番から、削除すべき画像を特定し、配列から削除する。
    files_array.splice(index - 1, 1);
  // クリックされたaタグが含まれるli要素をHTMLから削除する。
    var delete_image = $(this).parent().parent().remove();
    var add_width = $('.dropzone').css('width',$('.dropzone').width()+128)
    var count_image = files_array.length
    if (count_image == 9){
      $('.dropzone').show();
      $(".sell-dropbox__text").css("top", "5%");
      add_width
    }
    else if (count_image == 10){
      $('.dropzone').show();
    }
    else if (count_image == 8){
      $(".sell-dropbox__text").css("top", "37%");
    }
    else if (count_image == 4){
      $('#preview-sub').show();
      $("#preview-sub").append(dropSub);
      add_width
    }
    else if ( count_image == 5){
      add_width
    }
    else if (count_image == 3){
      $('#preview-sub').hide();
      $('.dropzone').css('width', "240px"); 
    }
    else if (count_image == 0){
      $('.dropzone').css('width', "640px");
    }
    else if ( 0 < count_image && count_image < 3 ){
      add_width
    }
    else {
      add_width
    }
    var image_id = $(this).attr('id');
    if(image_id){
      $.ajax({
        url: '/products/delete',
        type: "DELETE",
        data: { id: image_id },
        dataType: 'json',
      }) 
      .done(function(){

      })
    }
  });

  // プレビュー画像の取得
  $(document).on('click', '.image-edit-btn', function(e) {
    var src = $('.image-edit-btn').parent().siblings("image-mam").find("img").attr('src');
    $(".trim-image-ori").attr("src", src);
    $(".sell-modal-trim").fadeIn(500);
    $(".modal-overlay").show();
  });

  // リサイズのキャンセル
  $(document).on('click', '.trim-btn-left', function(e) {
    $(".sell-modal-trim").hide();
    $(".modal-overlay").hide();
  });

  // モーダルの表示とバリデーションと画像データの送信
  $('.sell-form').on('submit', function(e) {
    e.preventDefault();
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
      var formdata = new FormData(this);
      $.each(files_array,function(index,file){
        formdata.append('images[url][]',file)
      })
      if(location.href.match(/new/)){
        $.ajax({
          url: '/products',
          type: 'POST',
          data: formdata,
          dataType: 'json',
          processData: false,
          contentType: false
        }) 
        .done(function(){
          $(".sell-modal-box").fadeIn(500);
          $(".modal-overlay").show();
        })
      } else{
        var product_id = $('.sellbox').attr('id');
        var url = `/products/${product_id}`;
        $.ajax({
          url: url,
          type: 'PATCH',
          data: formdata,
          dataType: 'json',
          processData: false,
          contentType: false
        }) 
        .done(function(){
          window.location.href = location.href.replace(/products\/[0-9]+\/edit/, "");
        })
      }
    }
  });
});
