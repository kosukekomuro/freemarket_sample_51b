require 'rails_helper'

describe MypagesController do
  categories = FactoryBot.create_list(:category, 13)
  brands = FactoryBot.create_list(:brand, 6564)
  products = FactoryBot.create(:product)
  describe 'GET #selling_list' do
    before do
      session[:user_id] = products.seller_id
      get :selling_list
    end
    it "renders the :selling_list template" do
      expect(response).to render_template :selling_list
    end
    it "assigns the requested product to @products" do
      expect(assigns(:products)).to eq [products]
    end
  end
  describe 'GET #seller_product' do
    before do
      session[:user_id] = products.seller_id
      get :seller_product, params: { format: products.id }
    end
    it "renders the :seller_product template" do
      expect(response).to render_template :seller_product
    end
    it "assigns the requested product to @product" do
      expect(assigns(:product)).to eq products
    end
  end
end
