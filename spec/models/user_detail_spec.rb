require 'rails_helper'

describe UserDetail do
  describe '#create' do
    it "is valid with a last_name, first_name, last_name_kana, first_name_kana" do
      user_detail = build(:user_detail)
      expect(user_detail).to be_valid
    end

    it "is invalid without a last_name" do
      user_detail = build(:user_detail, last_name: nil)
      user_detail.valid?
      expect(user_detail.errors[:last_name]).to include("を入力してください")
    end

    it "is invalid without a first_name" do
      user_detail = build(:user_detail, first_name: nil)
      user_detail.valid?
      expect(user_detail.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name_kana" do
      user_detail = build(:user_detail, last_name_kana: nil)
      user_detail.valid?
      expect(user_detail.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is check if regular expression of last_name_kana matches" do
      user_detail = build(:user_detail)
      user_detail.valid?
      expect(user_detail[:last_name_kana]).to match(/\A([ァ-ン]|ー)+\z/)
    end

    it "is invalid without a first_name_kana" do
      user_detail = build(:user_detail, first_name_kana: nil)
      user_detail.valid?
      expect(user_detail.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is check if regular expression of first_name_kana matches" do
      user_detail = build(:user_detail)
      user_detail.valid?
      expect(user_detail[:first_name_kana]).to match(/\A([ァ-ン]|ー)+\z/)
    end
  end
end
