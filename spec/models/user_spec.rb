require 'rails_helper'

describe User do
  describe '#create' do

    it "全てが存在すれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "nikcnameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "emailの入力が不十分の場合は登録できないこと" do
      user = build(:user, email: "test@test")
      user.valid?
      expect(user.errors[:email]).to include("は不正な値です")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが存在してもpassword_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "first_nameがないと登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "first_nameが全角でないと登録できないこと" do
      user = build(:user, first_name: "yamada")
      user.valid?
      expect(user.errors[:first_name]).to include("は不正な値です")
    end

    it "family_nameがないと登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_nameが全角でないと登録できないこと" do
      user = build(:user, family_name: "taro")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "first_name_kanaがないと登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが全角でないと登録できないこと" do
      user = build(:user, first_name_kana: "yamada")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("は不正な値です")
    end

    it "family_name_kanaがないと登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaがないと登録できないこと" do
      user = build(:user, family_name_kana: "taro")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end
  end

  describe '#create' do

    it "destination_first_nameがない場合は登録できないこと" do
      user = build(:sending_destination, destination_first_name: "")
      user.valid?
      expect(user.errors[:destination_first_name]).to include("を入力してください")
    end

    it "destination_family_nameがない場合は登録できないこと" do
      user = build(:sending_destination, destination_family_name: "")
      user.valid?
      expect(user.errors[:destination_family_name]).to include("を入力してください")
    end

    it "post_codeがない場合は登録できないこと" do
      user = build(:sending_destination, post_code: "")
      user.valid?
      expect(user.errors[:post_code]).to include("を入力してください")
    end

    it "prefecture_idがない場合は登録できないこと" do
      user = build(:sending_destination, prefecture_id: "")
      user.valid?
      expect(user.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      user = build(:sending_destination, city: "")
      user.valid?
      expect(user.errors[:city]).to include("を入力してください")
    end

    it "house_numberがない場合は登録できないこと" do
      user = build(:sending_destination, house_number: "")
      user.valid?
      expect(user.errors[:house_number]).to include("を入力してください")
    end

  end
end