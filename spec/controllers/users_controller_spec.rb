require 'rails_helper'

describe UsersController do
  describe 'GET #login' do
    it "正しいビューに変遷する" do
      get :login
      expect(response).to render_template :login
    end
  end

  describe 'GET #logout' do
    it "正しいビューに変遷する" do
      get :logout
      expect(response).to render_template :logout
    end
  end

  describe 'GET #sign_up' do
    it "正しいビューに変遷する" do
      get :sign_up
      expect(response).to render_template :sign_up
    end
  end

  describe 'GET #user_registration' do
    it "正しいビューに変遷する" do
      get :user_registration
      expect(response).to render_template :user_registration
    end
  end

  describe 'Post #address_registration' do
    context "user_registrationで正しく入力できた時" do
      it "正しいビューに変遷する" do
        get :address_registration, params: { user: {nickname: "yamadaa", email: "yamada@yahoo.co.jp", password: "123456", password_confirmation: "123456"} }
        expect(response).to render_template :address_registration
      end
    end

    context "user_registrationで正しく入力できていない時" do
      it "正しいビューに変遷する" do
        get :address_registration, params: { user: {nickname: "", email: "yamada@yahoo.co.jp", password: "123456", password_confirmation: "123456"} }
        expect(response).to render_template :user_registration
      end
    end
  end

  describe 'Post #create' do
    context "address_registrationで正しく入力できた時" do
      it "データベースに値が保存される" do
        expect{
          post :create,
            params: {
            user: {
            nickname: "yamada",
            email: "yamada@yahoo.co.jp",
            password: "123456",
            password_confirmation: "123456",
            user_detail_attributes: {
              last_name: "やまだ",
              first_name: "たろう",
              last_name_kana: "ヤマダ",
              first_name_kana: "タロウ"
            },
            user_address_attributes: {
              postal_code: "150-0041",
              prefecture_id: "1",
              municipalitie: "渋谷区神南",
              address: "1丁目12−16",
              building_name: "アジアビル8F"
            }
          }
        },
        session: { nickname: "yamada", email: "yamada@yahoo.co.jp", password: "123456", password_confirmation: "123456" }
        }.to change(User, :count).by(1)
      end

      it "正しいビューに変遷する" do
        post :create,
        params: {
          user: {
            nickname: "yamada",
            email: "yamada@yahoo.co.jp",
            password: "123456",
            password_confirmation: "123456",
            user_detail_attributes: {
              last_name: "やまだ",
              first_name: "たろう",
              last_name_kana: "ヤマダ",
              first_name_kana: "タロウ"
            },
            user_address_attributes: {
              postal_code: "150-0041",
              prefecture_id: "1",
              municipalitie: "渋谷区神南",
              address: "1丁目12−16",
              building_name: "アジアビル8F"
            }
          }
        },
        session: {
          nickname: "yamada",
          email: "yamada@yahoo.co.jp",
          password: "123456",
          password_confirmation: "123456"
        }
        expect(response).to redirect_to registration_complete_users_path
      end
    end

    context "address_registrationで正しく入力できていない時" do
      it "データベースに値が保存されない" do
        expect{
          post :create,
        params: {
          user: {
            nickname: "yamada",
            email: "yamada@yahoo.co.jp",
            password: "123456",
            password_confirmation: "123456",
            user_detail_attributes: {
              last_name: "",
              first_name: "たろう",
              last_name_kana: "ヤマダ",
              first_name_kana: "タロウ"
            },
            user_address_attributes: {
              postal_code: "150-0041",
              prefecture_id: "1",
              municipalitie: "渋谷区神南",
              address: "1丁目12−16",
              building_name: "アジアビル8F"
            }
          }
        },
        session: { nickname: "yamada", email: "yamada@yahoo.co.jp", password: "123456", password_confirmation: "123456" }
        }.to change(User, :count).by(0)
      end

      it "正しいビューに変遷する" do
        post :create,
        params: {
          user: {
            nickname: "yamada",
            email: "yamada@yahoo.co.jp",
            password: "123456",
            password_confirmation: "123456",
            user_detail_attributes: {
              last_name: "",
              first_name: "たろう",
              last_name_kana: "ヤマダ",
              first_name_kana: "タロウ"
            },
            user_address_attributes: {
              postal_code: "150-0041",
              prefecture_id: "1",
              municipalitie: "渋谷区神南",
              address: "1丁目12−16",
              building_name: "アジアビル8F"
            }
          }
        },
        session: {
          nickname: "yamada",
          email: "yamada@yahoo.co.jp",
          password: "123456",
          password_confirmation: "123456"
        }
        expect(response).to render_template :address_registration
      end
    end
  end

end