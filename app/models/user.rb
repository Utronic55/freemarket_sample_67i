class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
         VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
         VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
         VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/
         VALID_PASSWORD_REGEX = /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d!@#\$%\^\&*\)\(+=._-]{7,128}\z/i
       
      #    # 登録の際のビジネスルール
         validates :nickname, presence: true, length: { maximum: 15 }
         validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'のフォーマットが不適切です'}
        #  validates :password, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
        #  validates :password_confirmation, presence: true, length: { in: 7..128 }, format: { with: VALID_PASSWORD_REGEX, message: 'は英字と数字両方を含むパスワードを設定してください'}
         validates :last_name, presence: true, length: { maximum: 30 }
         validates :first_name, presence: true, length: { maximum: 30 }
         validates :last_name_kana, presence: true, length: { maximum: 30 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
         validates :first_name_kana, presence: true, length: { maximum: 30 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
         validates :birth_year, presence: true
         validates :birth_month, presence: true
         validates :birth_day, presence: true

         has_one :address
         has_many :buyed_items, foreign_key: "buyer_id", class_name: "Item"
         has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "saler_id", class_name: "Item"
         has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "saler_id", class_name: "Item"

       
       end