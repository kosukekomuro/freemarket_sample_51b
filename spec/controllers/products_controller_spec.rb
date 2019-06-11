require 'rails_helper'

describe ProductsController do
  categories = FactoryBot.create_list(:category, 13)
  brands = FactoryBot.create_list(:brand, 6564)
  products = FactoryBot.create(:product)
  describe 'GET #index' do
    before do
      get :index
    end
    it "renders the :index template" do
      expect(response).to render_template :index
    end
    it "assigns the requested product to @category_first" do
      expect(assigns(:category_first)).to eq categories[0]
    end
    it "assigns the requested product to @category_first_items" do 
      expect(assigns(:category_first_items)).to eq [products]
    end
    it "assigns the requested product to @category_second" do
      expect(assigns(:category_second)).to eq categories[1]
    end
    it "assigns the requested product to @category_first_second" do
      expect(assigns(:category_second_items)).to eq []
    end
    it "assigns the requested product to @category_third" do
      expect(assigns(:category_third)).to eq categories[2]
    end
    it "assigns the requested product to @category_first_third" do
      expect(assigns(:category_third_items)).to eq []
    end
    it "assigns the requested product to @category_fourth" do 
      expect(assigns(:category_fourth)).to eq categories[6]
    end
    it "assigns the requested product to @category_first_fourth" do
      expect(assigns(:category_fourth_items)).to eq []
    end
  end
  describe 'POST #pay' do
    user = FactoryBot.create(:user)
    before do
      session[:user_id] = user.id
      post :pay, params: { id: products.id }
    end
    it "redirect to payjp" do
      expect(response).to redirect_to('http://test.host/')
    end
    it "assigns the requested cards to @product" do
      expect(assigns(:product)).to eq products
    end
  end
  describe 'GET #show' do
    before do
      get :show, params: { id: products.id }
    end
    it "renders the :show template" do
      expect(response).to render_template :show
    end
    it "assigns the requested cards to @user_products" do
      expect(assigns(:user_products)).to eq []
    end
    it "assigns the requested cards to @brand_category_products" do
      expect(assigns(:brand_category_products)).to eq []
    end
    it "assigns the requested cards to @previous_product" do
      expect(assigns(:previous_product)).to eq nil
    end
    it "assigns the requested cards to @next_product" do
      expect(assigns(:next_product)).to eq nil
    end
  end
  # describe 'GET #search' do
  #   it "search products with input keyword fullwidth" do
  #     get :search, params: {keyword: "せーたー"}
  #     expect(response).to render_template :search
  #   end
  #   it "search products with input keyword 全角カナ" do
  #     get :search, params: {keyword: "セーター"}
  #     expect(response).to render_template :search
  #   end
  #   it "search products with input keyword 半角カナ" do
  #     get :search, params: {keyword: "ﾎﾞｳｼ"}
  #     expect(response).to render_template :search
  #   end
  #   it "search products with input keyword environmental_dependency_character" do
  #     get :search, params: {keyword: "㌶Ⅲ⑳㏾☎㈱髙﨑"}
  #     expect(response).to render_template :search
  #   end
  #   it "search products with input keyword surrogate_pair" do
  #     get :search, params: {keyword: "𠀋𡈽𡌛𡑮𡢽𠮟𡚴𡸴𣇄𣗄"}
  #     expect(response).to render_template :search
  #   end
  #   it "search products with input keyword pictograph" do
  #     get :search, params: {keyword: "😀🐱🚗"}
  #     expect(response).to render_template :search
  #   end
  # end
end
