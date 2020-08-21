require 'rails_helper'

RSpec.describe Consumer, type: :model do
   pending "add some examples to (or delete) #{__FILE__}"
  
  before do
    @consumer = FactoryBot.build(:consumer)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
        it "登録情報を入力していれば登録できる" do
          expect(@consumer).to be_valid
        end

        it "passwordが6文字以上であれば登録できる" do
          @consumer.password = "abc123"
          @consumer.password_confirmation = "abc123"
          expect(@consumer).to be_valid
        end

        it  "emailは半角英数と@を含んでいれば登録できる" do
          @consumer.email = "address123@address.com"
          @consumer.valid?
          expect(@consumer).to be_valid
        end
        
        it  "パスワードは半角英数混合であれば登録できる" do
          @consumer.password = "abc123" 
          @consumer.valid?
          expect(@consumer).to be_valid
        end
        
    end
  
   context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @consumer.nickname = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Nickname can't be blank")
      end
      
      it  "emailが空では登録できない" do
        @consumer.email = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Email can't be blank", "Email can't be blank")
      end
      

      it "メールアドレスが一意性でなければ登録できない" do
        @consumer.save
        another_consumer = FactoryBot.build(:consumer)
        another_consumer.email = @consumer.email
        another_consumer.valid?
        expect(another_consumer.errors.full_messages).to include("Email has already been taken")
      end

      it "emailは@を含んでいなければ登録できない。" do
        @consumer.email = "address123address.com"
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @consumer.password = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Password can't be blank",
          "Password can't be blank",
          "Password confirmation doesn't match Password"
          )
      end

      it "password_confirmationを入力しpasswordと一致していないと登録できない" do
        @consumer.password_confirmation = "password"
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが６文字以上でなければ登録できない" do
        @consumer.password = "abc12"
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Password confirmation doesn't match Password",
          "Password is too short (minimum is 6 characters)")
      end

      it "passwordが半角英数混合でなければ登録できない" do
        @consumer.password = "abcdef"
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "姓名、氏名がないと登録できない" do
        @consumer.first_name = ""
        @consumer.last_name = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("First name can't be blank", "Last name can't be blank")
      end
      
      it "氏名の振り仮名がないとと登録できない" do
        @consumer.first_name_kana = ""
        @consumer.last_name_kana = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("First name kana can't be blank",
          "Last name kana can't be blank"
          )
      end
      
      it "生年月日がないと登録できない" do
        @consumer.birthday = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Birthday can't be blank")
      end

   end
  end
end 
