FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    first_name            {"山田"}
    family_name           {"太郎"}
    first_name_kana       {"やまだ"}
    family_name_kana      {"たろう"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birth_year            {2010}
    birth_month           {10}
    birth_day             {10}
  end

  factory :sending_destination do
    destination_first_name {"山田"}
    destination_family_name {"太郎"}
    destination_first_name_kana {"やまだ"}
    destination_family_name_kana {"たろう"}
    post_code {"1111111"}
    prefecture_id {1}
    city {"福岡市"}
    house_number {"1-1-1"}
  end

end