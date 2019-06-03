FactoryBot.define do

  factory :product do
    name                  {"セーター"}
    price                 {"1500"}
    trading_evaluation_id {"1"}
    brand_id              {"1"}
    category_id           {"1"}
    seller_id             {"1"}
    buyer_id              {"1"}
    size_id               {"1"}
    condition_id          {"1"}
    delivery_method_id    {"1"}
    prefecture_id         {"1"}
    delivery_day_id       {"1"}
    description           {"セーターです。"}
  end

end
