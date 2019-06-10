require 'rails_helper'
describe User do
  describe '#create' do

    it "is valid with a nickname, email, password, password_confirmation" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is invalid without a nickname" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "is invalid without a email" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "is invalid with a duplicate email address" do
      user = create(:user, email: "aa@aa.aa")
      another_user = build(:user, email: "aa@aa.aa")
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "is check if regular expression of email matches" do
      user = build(:user)
      user.valid?
      expect(user[:email]).to match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/)
    end
  end
end
