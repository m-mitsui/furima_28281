FactoryBot.define do
  factory :consumer do
    nickname              {"ミック"}
    email                 {"address123@address.com"}
    password              {"abc123"}
    password_confirmation {password}
    first_name            {"三ツ井"}
    last_name             {"正光"}
    first_name_kana       {"ミツイ"}
    last_name_kana        {"マサミツ"}
    birthday              {"1991-05-17"}
  end
end