require 'rails_helper'

RSpec.describe Consumer, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  before do
    @consumer = FactoryBot.build(:consumer)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
        it "登録情報を入力していれば登録できる" do
          expect(@consumer).to be_valid
        end

        it "passwordが6文字以上であれば登録できる" do
          @consumer.password = "aaaaaaaa"
          @consumer.password_confirmation = "aaaaaaaa"
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
      
      it  "passwordがありpassword_confirmationと一致していないと登録できない" do
        @consumer.password = ""
        @consumer.valid?
        expect(@consumer.errors.full_messages).to include("Password can't be blank",
          "Password can't be blank",
          "Password confirmation doesn't match Password"
          )
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
