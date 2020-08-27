FactoryBot.define do
  factory :product do
    name                {"商品の名前"}
    image               {Rack::Test::UploadedFile.new(File.join(Rails.root, 'public/images/test_image.png'))}
    explain          {"商品の説明　プロジェクター　互換性多々あり"}  
    category            {"商品カテゴリー"}
    status              {"商品の状態"}
    delivery_fee        {"配送料の負担"}
    delivery_time       {"2~3日"}
    ship_from           {"発送元の地域"}
    price               {1000}
    association :consumer
  end
end
