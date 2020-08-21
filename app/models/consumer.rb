class Consumer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  
  has_many :buys
  has_many :products
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    zenkaku_kanakanji = /\A[ぁ-んァ-ン一-龥]/
    hankakueisuukigou = /\A\S+@\S+\.\S+\z/
    hannkakueisuu = /\A[a-zA-Z0-9]+\z/
    zenkakuk_kana = /\A[ァ-ヶー－]+\z/
  with_options presence: true do
    validates :nickname, format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :email,  format: {with: /\A\S+@\S+\.\S+\z/} #/\A\S+@\S+\.\S+\z/
    validates :password,   format: {with: /\A[a-zA-Z0-9]+\z/}
    validates :first_name,  format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :last_name,   format: {with: /\A[ぁ-んァ-ン一-龥]/}
    validates :first_name_kana,  format: {with: /\A[ァ-ヶー－]+\z/}
    validates :last_name_kana,   format: {with: /\A[ァ-ヶー－]+\z/}
    validates :birthday
  end
end
