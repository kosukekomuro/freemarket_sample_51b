FactoryBot.define do

  factory :product do
    name                  {"セーター"}
    price                 {"1500"}
    trading_evaluation {create(:trading_evaluation)}
    brand_id              {"1"}
    category_id           {"1"}
    seller                {create(:user)}
    size                  {create(:size)}
    condition_id          {"1"}
    delivery_method_id    {"1"}
    prefecture            {create(:prefecture)}
    delivery_day          {create(:delivery_day)}
    description           {"セーターです。"}
  end

end
