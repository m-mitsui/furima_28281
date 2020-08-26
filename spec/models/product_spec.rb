require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('public/images/test_image.png')
  end

  describe '商品出品' do
    context '商品出品がうまくいく時' do
      it "各カラムに必要な情報があれば登録できる" do
      expect(@product).to be_valid
      end

      it "販売価格は半角数字のみ入力可能であること" do
         @product.price = 1000
         expect(@product).to be_valid
      end

      it "販売価格は３００円以上であること" do
        @product.price = 300
        expect(@product).to be_valid
      end

      it "販売価格は9999999円以下であること" do
        @product.price = 9999999
        expect(@product).to be_valid
      end

    end
    context '商品出品がうまくいかない時' do
      it  "商品画像がないと登録できない" do
        #  @product.image = nil
        #  @product.valid?
        #  binding.pry
      end

      it  "商品名がないと登録できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank", "Name is invalid")
      end

      it  "商品の説明がない登録できない" do
        @product.explain = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Explain can't be blank", "Explain is invalid")
      end

      it  "カテゴリーの情報がないと登録できない" do
        @product.category = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end

      it  "商品の状態についての情報がないと登録できない" do
        @product.status = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Status can't be blank")
      end

      it  "配送料の負担の情報がないと登録できない" do
        @product.delivery_fee = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery fee can't be blank")
      end

      it  "発送元の地域情報がないと登録できない" do
        @product.ship_from = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Ship from can't be blank")
      end

      it  "発送までの日数情報がないと登録できない" do
        @product.delivery_time = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Delivery time can't be blank")
      end

      it  "価格の情報がないと登録できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank", "Price is not a number")
      end

      it  "価格の範囲が、¥300~¥9999999でないと登録できない" do
        @product.price = "200"
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

    end
  end
end
