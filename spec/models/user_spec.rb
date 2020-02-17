require 'rails_helper'

describe User do
  describe '#create' do

# ユーザー情報

  # ニックネーム
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
  # メール
    it "is invalid without a address" do
      user = build(:user, address: "")
      user.valid?
      expect(user.errors[:address]).to include("フォーマットが不適切です")
    end
  # パスワード
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

  # パスワードが7文字以上であるか

    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "a2345", password_confirmation: "a2345")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "a234567", password_confirmation: "a234567")
      user.valid?
      expect(user).to be_valid
    end

  # パスワードとパスワード（確認）が一致しているか

    it "is valid with a password and password confirmation match " do
      user = build(:user, password: "a123456", password_confirmation: "a123456")
      user.valid?
      expect(user).to be_valid
    end

    it "is valid with a password and password confirmation match " do
      user = build(:user, password: "a123456", password_confirmation: "b987654")
      user.valid?
      expect(user.errors[:password_confirmation][0]).to include("とパスワードの入力が一致しません")
    end

    it "is invalid without a password_confirmation" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("を入力してください")
    end

    # 氏名がカナ入力になっているか

    it "is valid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a last_name_kana that katakana " do
      user = build(:user, last_name_kana: "あ")
      user.valid?
      expect(user.errors[:last_name_kana][0]).to include("はカタカナで入力して下さい")
    end

    it "is valid with a first_name_kana that katakana " do
      user = build(:user, first_name_kana: "ア")
      user.valid?
      expect(user).to be_valid
    end

    it "is invalid with a first_name_kana that katakana " do
      user = build(:user, first_name_kana: "あ")
      user.valid?
      expect(user.errors[:first_name_kana][0]).to include("はカタカナで入力して下さい")
    end

# 本人確認情報

    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end


    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "is invalid without a last_name_kana" do
      user = build(:user, last_name_kana: "")
      user.valid?
      expect(user.errors[:last_name_kana]).to include("を入力してください")
    end

    it "is invalid without a first_name_kana" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

# 商品送付住所情報

  # 郵便番号
    it "is invalid without a number" do
      user = build(:user, number: "")
      user.valid?
      expect(user.errors[:number]).to include("を入力してください")
    end
  # 都道府県
    it "is invalid without a prefecture" do
      user = build(:user, prefecture: "")
      user.valid?
      expect(user.errors[:prefecture]).to include("を入力してください")
    end
  # 市町村区
    it "is invalid without a city" do
      user = build(:user, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end
  # 番地
    it "is invalid without a town" do
      user = build(:user, town: "")
      user.valid?
      expect(user.errors[:town]).to include("を入力してください")
    end
  end
end
