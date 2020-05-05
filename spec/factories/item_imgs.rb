FactoryBot.define do

  factory :item_img do
    url               {File.open("#{Rails.root}/app/assets/images/8b1d_s.jpg")}
    item
  end
end