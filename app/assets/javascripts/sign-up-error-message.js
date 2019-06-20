$(document).on("turbolinks:load", function() {

  jQuery.validator.addMethod("email_regexp", function(value, element) {
    return this.optional( element ) || /^[\w+\-.]+@[a-z\d\-.]+\.[a-z]+$/.test( value );
  }, 'フォーマットが不適切です');

  jQuery.validator.addMethod("postal_code_regexp", function(value, element) {
    return this.optional( element ) || /^\d{3}-?\d{4}$/.test( value );
  }, 'フォーマットが不適切です');

  jQuery.validator.addMethod("name_kana_regexp", function(value, element) {
    return this.optional( element ) || /^([ァ-ン]|ー)+$/.test( value );
  }, '全角カナ で入力してください');

  $("#user_registration_form").validate({
    rules: {
      "user[nickname]": {
        required: true
      },
      "user[email]": {
        required: true,
        email_regexp: true
      },
      "user[password]": {
        required: true,
        minlength: 6,
        maxlength: 128
      },
      "user[password_confirmation]": {
        required: true,
        minlength: 6,
        maxlength: 128,
        equalTo: "#sign-up-password"
      }
    },
    messages: {
      "user[nickname]": {
        required: "ニックネーム を入力してください"
      },
      "user[email]": {
        required: "メールアドレス を入力してください"
      },
      "user[password]": {
        required: "パスワード を入力してください",
        minlength: "パスワードは6文字以上128文字以下で入力してください",
        maxlength: "パスワードは6文字以上128文字以下で入力してください"
      },
      "user[password_confirmation]": {
        required: "パスワード (確認) を入力してください",
        minlength: "パスワードは6文字以上128文字以下で入力してください",
        maxlength: "パスワードは6文字以上128文字以下で入力してください",
        equalTo: "パスワードとパスワード (確認) が一致しません"
      }
    }
  });

  $("#user_registration_sns_form").validate({
    rules: {
      "user[nickname]": {
        required: true
      },
      "user[email]": {
        required: true,
        email_regexp: true
      }
    },
    messages: {
      "user[nickname]": {
        required: "ニックネーム を入力してください"
      },
      "user[email]": {
        required: "メールアドレス を入力してください"
      }
    }
  });

  $("#address_registration_form").validate({
    rules: {
      "user[user_detail_attributes][first_name]": {
        required: true
      },
      "user[user_detail_attributes][last_name]": {
        required: true
      },
      "user[user_detail_attributes][first_name_kana]": {
        required: true,
        name_kana_regexp: true
      },
      "user[user_detail_attributes][last_name_kana]": {
        required: true,
        name_kana_regexp: true
      },
      "user[user_address_attributes][postal_code]": {
        required: true,
        postal_code_regexp: true
      },
      "user[user_address_attributes][prefecture_id]": {
        required: true
      },
      "user[user_address_attributes][municipalitie]": {
        required: true
      },
      "user[user_address_attributes][address]": {
        required: true
      }
    },
    messages: {
      "user[user_detail_attributes][first_name]": {
        required: "姓 を入力してください"
      },
      "user[user_detail_attributes][last_name]": {
        required: "名 を入力してください"
      },
      "user[user_detail_attributes][first_name_kana]": {
        required: "姓カナ を入力してください"
      },
      "user[user_detail_attributes][last_name_kana]": {
        required: "名カナ を入力してください"
      },
      "user[user_address_attributes][postal_code]": {
        required: "郵便番号 を入力してください"
      },
      "user[user_address_attributes][prefecture_id]": {
        required: "都道府県 を選択してください"
      },
      "user[user_address_attributes][municipalitie]": {
        required: "市区町村 を入力してください"
      },
      "user[user_address_attributes][address]": {
        required: "番地 を入力してください"
      }
    }
  });
});
