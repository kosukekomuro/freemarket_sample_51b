require 'rails_helper'

describe UserAddress do
  describe '#create' do
    it "is valid with a postal_code, prefecture_id, municipalitie, address, building_name" do
      user_address = build(:user_address)
      expect(user_address).to be_valid
    end

    it "is valid with a postal_code, prefecture_id, municipalitie, address" do
      user_address = build(:user_address, building_name: nil)
      expect(user_address).to be_valid
    end

    it "is invalid without a postal_code" do
      user_address = build(:user_address, postal_code: nil)
      user_address.valid?
      expect(user_address.errors[:postal_code]).to include("を入力してください")
    end

    it "is check if regular expression of postal_code matches" do
      user_address = build(:user_address)
      user_address.valid?
      expect(user_address[:postal_code]).to match(/\A\d{3}[-]\d{4}\z|\A\d{7}\z/)
    end

    it "is invalid without a prefecture_id" do
      user_address = build(:user_address, prefecture_id: nil)
      user_address.valid?
      expect(user_address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "is invalid without a municipalitie" do
      user_address = build(:user_address, municipalitie: nil)
      user_address.valid?
      expect(user_address.errors[:municipalitie]).to include("を入力してください")
    end

    it "is invalid without a address" do
      user_address = build(:user_address, address: nil)
      user_address.valid?
      expect(user_address.errors[:address]).to include("を入力してください")
    end
  end
end
