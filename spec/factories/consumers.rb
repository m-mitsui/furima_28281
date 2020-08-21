FactoryBot.define do
  factory :consumer do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"三ツ井"}
    last_name             {"正光"}
    first_name_kana       {"ミツイ"}
    last_name_kana        {"マサミツ"}
    birthday              {"1991-05-17"}
  end
end