require 'rails_helper'

RSpec.describe Consumer, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  
  before do
    @consumer = FactoryBot.build(:consumer)
  end
  
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      @consumer.nickname = ""
      @consumer.valid?
      expect(@consumer.errors.full_messages).to include("Nickname can't be blank", "Birthday is not a number")
    end
    it  "emailが空では登録できない" do
      @consumer.email = ""
      @consumer.valid?
      expect(@consumer.errors.full_messages).to include("Email can't be blank", "Email can't be blank", "Birthday is not a number")
    end
    it  "passwordがありpassword_confirmationと一致していないと登録できない" do
      @consumer.password = ""
      @consumer.valid?
      expect(@consumer.errors.full_messages).to include("Password can't be blank",
        "Password can't be blank",
        "Password confirmation doesn't match Password",
        "Birthday is not a number")
    end
    it "first_nameとlast_nameがないと登録できない" do
      @consumer.first_name = ""
      @consumer.last_name = ""
      @consumer.valid?
      expect(@consumer.errors.full_messages).to include("First name can't be blank", "Last name can't be blank", "Birthday is not a number")
    end
    it "氏名の振り仮名がないとと登録できない" do
      @consumer.first_name_kana = ""
      @consumer.last_name_kana = ""
      @consumer.valid?
      expect(@consumer.errors.full_messages).to include("First name kana can't be blank",
        "Last name kana can't be blank",
        "Birthday is not a number")
    end
    it "生年月日がないと登録できない" do
      @consumer.birthday = ""
      @consumer.valid?
      expect(@consumer.errors.full_messages).to include("Birthday is not a number")
    end
  end
end 
