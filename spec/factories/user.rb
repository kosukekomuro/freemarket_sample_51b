require 'faker'

FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(8)
    email {Faker::Internet.free_email}
    nickname {Faker::Name.name}
    password {password}
    password_confirmation {password}
    card_id {"cus_fccd338e19bc5e8c3dcf80cb003d"}
  end
end
