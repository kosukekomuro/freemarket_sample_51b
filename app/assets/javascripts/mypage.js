$(function(){
  function changeTabTodo(){
    var html = `<img src="//www-mercari-jp.akamaized.net/assets/img/common/common/logo-gray.svg?3856598694" />
                <h2>現在、やることリストはありません</h2>`
    return html;
  }
  function changeTabNotification(){
    var html = `<div class='item'>
                  <img class="notification__image" src="//static.mercdn.net/images/mercari_profile.png" />
                  <div class='message'>
                    <div class='message__text'>事務局から個別メッセージ「ログイン通知」</div>
                    <i class="fa fa-clock clock"></i>
                    <div class='message__time'>1時間前</div>
                  </div>
                  <i class="fa fa-angle-right"></i>
                </div>
                <div class='item'>
                  <img class="notification__image" src="//static.mercdn.net/images/mercari_profile.png" />
                  <div class='message'>
                    <div class='message__text'>明日、50%還元お得チケットの有効期限が切れます！詳細を確認しましょう。</div>
                    <i class="fa fa-clock clock"></i>
                    <div class='message__time'>2時間前</div>
                  </div>
                  <i class="fa fa-angle-right"></i>
                </div>
                <div class='item'>
                  <img class="notification__image" src="//static.mercdn.net/images/mercari_profile.png" />
                  <div class='message'>
                    <div class='message__text'>事務局から個別メッセージ「ログイン通知」</div>
                    <i class="fa fa-clock clock"></i>
                    <div class='message__time'>3時間前</div>
                  </div>
                  <i class="fa fa-angle-right"></i>
                </div>
                <div class='item'>
                  <img class="notification__image" src="//static.mercdn.net/images/mercari_profile.png" />
                  <div class='message'>
                    <div class='message__text'>【出品はじめかたガイド】安心でかんたんに出品する方法をCHECKしてみよう！</div>
                    <i class="fa fa-clock clock"></i>
                    <div class='message__time'>4時間前</div>
                  </div>
                  <i class="fa fa-angle-right"></i>
                </div>
                <div class='item'>
                  <img class="notification__image" src="//static.mercdn.net/images/mercari_profile.png" />
                  <div class='message'>
                    <div class='message__text'>《メルカリご登録記念》"最大500円分"をポイントバック！</div>
                    <i class="fa fa-clock clock"></i>
                    <div class='message__time'>5時間前</div>
                  </div>
                  <i class="fa fa-angle-right"></i>
                </div>
                <div class='list'>
                  <div class='list__btn'>
                    <span>一覧を見る</span>
                  </div>
                </div>`
    return html;
  }
  function changeTabTransactionOld(){
    var html = `<img src="//www-mercari-jp.akamaized.net/assets/img/common/common/logo-gray.svg?3856598694" />
                <h2>過去に取引した商品がありません</h2>`
    return html;
  }
  function changeTabTransactionNow(){
    var html = `<img src="//www-mercari-jp.akamaized.net/assets/img/common/common/logo-gray.svg?3856598694" />
                <h2>取引中の商品がありません</h2>`
    return html;
  }
  $(document).on('click','#notification', function(e) {
    $('.user-information__tab__notification').css({'background-color':"white", 'height':"72px", 'margin-top':"2px"});
    $('.user-information__tab__todo-list').css({'background-color':"#eee", 'height':"74px", 'margin-top':"0px"});
    $('.user-information__contents').empty();
    $('.user-information__contents').append(changeTabNotification());
  })
  $(document).on('click','#todo-list', function(e) {
    $('.user-information__tab__todo-list').css({'background-color':"white", 'height':"72px", 'margin-top':"2px"});
    $('.user-information__tab__notification').css({'background-color':"#eee", 'height':"74px", 'margin-top':"0px"});
    $('.user-information__contents').empty();
    $('.user-information__contents').append(changeTabTodo());
  })
  $(document).on('click','#transaction-now', function(e) {
    $('.transaction__tab__now').css({'background-color':"white", 'height':"72px", 'margin-top':"2px"});
    $('.transaction__tab__old').css({'background-color':"#eee", 'height':"74px", 'margin-top':"0px"});
    $('.transaction__contents').empty();
    $('.transaction__contents').append(changeTabTransactionNow());
  })
  $(document).on('click','#transaction-old', function(e) {
    $('.transaction__tab__old').css({'background-color':"white", 'height':"72px", 'margin-top':"2px"});
    $('.transaction__tab__now').css({'background-color':"#eee", 'height':"74px", 'margin-top':"0px"});
    $('.transaction__contents').empty();
    $('.transaction__contents').append(changeTabTransactionOld());
  })
})
