FactoryBot.define do

  factory :item do
    name               {"Rubyの本"}
    introduction       {"よくわかる本です"}
    price              {"1000"}
    size_id            {"1"}
    item_condition_id  {"1"}
    postage_payer_id   {"1"}
    preparation_day_id {"1"}
    postage_type_id    {"1"}
    brand_id           {"1"}
    prefecture_id      {"1"}
    trading_status     {"0"}
    buyer_id           {""}
    seller             {create(:user)}
    category           {create(:category)}
    after(:build) do |item|
      item.item_imgs << build(:item_img, item: item)
    end
  end
end