require 'rails_helper'

describe CardsController do
  user = FactoryBot.create(:user)
  describe 'GET #index' do
    before do
      get :index
    end
    it "renders the :index template" do
      expect(response).to render_template :index
    end
    it "assigns the requested cards to @url" do
      expect(assigns(:url)).to eq "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?3856598694"
    end
    it "assigns the requested cards to @user" do
      expect(assigns(:user)).to eq user
    end
  end
  describe 'DELETE #destory' do
    before do
      delete :destroy , params: { id: 1 }
    end
    it "redirect to payjp" do
      expect(response).to redirect_to('http://test.host/cards')
    end
  end
end
