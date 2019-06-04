require 'rails_helper'

describe ProductsController do
  describe 'GET #index' do
    categories = FactoryBot.create_list(:category, 13)
    brands = FactoryBot.create_list(:brand, 6564)
    products = FactoryBot.create(:product)
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
end