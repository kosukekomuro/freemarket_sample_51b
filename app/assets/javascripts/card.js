$(function(){
  function addErrorMessage(){
    var html = `<p>このカードはご利用になれません。エラーコードを添えてお問い合わせください。 エラーコード: [200161]</p>`
    return html;
  }
  $(document).on('click','#card-registration__btn', function(e) {
    e.preventDefault();
    Payjp.setPublicKey('pk_test_ada74dd71ebc551b35ce2041');
    var card = {
      number: parseInt($("#card_number").val()),
      cvc: parseInt($("#security_code").val()),
      exp_month: parseInt($("#valid_month").val()),
      exp_year: parseInt($("#valid_year").val())
    };
    Payjp.createToken(card, function(status, response) {
      if (status == 200) {
        var token = response.id;
        var url = location.href.match(/users/) ? '/users' : '/cards' ;
        $.ajax({
          url: url,
          type: "POST",
          data: { token: token },
          dataType: 'json',
        })
        .done(function(){
          if(location.href.match(/users/)){
            window.location.href = location.href.replace(/card_registration.+/, "registration_complete");
          }
          else{
            window.location.href = location.href.replace( '/new', '' );
          }
        })
        .fail(function(){
          alert('fail');
          if(location.href.match(/users/)){
            window.location.href = location.href.replace(/card_registration.+/, "user_registration");
          }
        })
      }
      else {
        $('.sign-up__main__container__body__form').prepend(addErrorMessage());
        $('form')[0].reset();
        alert('error');
      }
    });
  })
})
