require 'faker'

FactoryBot.define do

  factory :user do
    password = Faker::Internet.password(8)
    email {Faker::Internet.free_email}
    password {password}
    password_confirmation {password}
    card_id {"cus_77c7cd0733b4678367b3ae4d13fe"}
  end

end
