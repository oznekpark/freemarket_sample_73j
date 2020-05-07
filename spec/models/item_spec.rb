require 'rails_helper'

  describe Item do
    describe "#create" do
      it "全ての項目があれば登録できること" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "画像がなければ登録できないこと" do
        item = build(:item)
        item.item_imgs = []
        item.valid?
        expect(item.errors[:item_imgs]).to include("を入力してください")
      end

      it "カテゴリがなければ登録できないこと" do
        item = build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end

      it "商品名がなければ登録できないこと" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "商品詳細がなければ登録できないこと" do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it "商品状態がなければ登録できないこと" do
        item = build(:item, item_condition_id: nil)
        item.valid?
        expect(item.errors[:item_condition_id]).to include("を入力してください")
      end

      it "配送方法がなければ登録できないこと" do
        item = build(:item, postage_type_id: nil)
        item.valid?
        expect(item.errors[:postage_type_id]).to include("を入力してください")
      end

      it "配送料の負担がなければ登録できないこと" do
        item = build(:item, postage_payer_id: nil)
        item.valid?
        expect(item.errors[:postage_payer_id]).to include("を入力してください")
      end

      it "配送元の地域がなければ登録できないこと" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      it "発送までの日数がなければ登録できないこと" do
        item = build(:item, preparation_day_id: nil)
        item.valid?
        expect(item.errors[:preparation_day_id]).to include("を入力してください")
      end

      it "販売価格がなければ登録できないこと" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "販売価格がなければ登録できないこと" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "販売価格が299だと登録できないこと" do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      it "販売価格が１千万だと登録できないこと" do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("は9999999以下の値にしてください")
      end
    end
  end

  describe Item do
    describe "#update" do
      it "全ての項目があれば登録できること" do
        item = build(:item)
        expect(item).to be_valid
      end

      it "画像がなければ登録できないこと" do
        item = build(:item)
        item.item_imgs = []
        item.valid?
        expect(item.errors[:item_imgs]).to include("を入力してください")
      end

      it "カテゴリがなければ登録できないこと" do
        item = build(:item, category: nil)
        item.valid?
        expect(item.errors[:category]).to include("を入力してください")
      end

      it "商品名がなければ登録できないこと" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "商品詳細がなければ登録できないこと" do
        item = build(:item, introduction: nil)
        item.valid?
        expect(item.errors[:introduction]).to include("を入力してください")
      end

      it "商品状態がなければ登録できないこと" do
        item = build(:item, item_condition_id: nil)
        item.valid?
        expect(item.errors[:item_condition_id]).to include("を入力してください")
      end

      it "配送方法がなければ登録できないこと" do
        item = build(:item, postage_type_id: nil)
        item.valid?
        expect(item.errors[:postage_type_id]).to include("を入力してください")
      end

      it "配送料の負担がなければ登録できないこと" do
        item = build(:item, postage_payer_id: nil)
        item.valid?
        expect(item.errors[:postage_payer_id]).to include("を入力してください")
      end

      it "配送元の地域がなければ登録できないこと" do
        item = build(:item, prefecture_id: nil)
        item.valid?
        expect(item.errors[:prefecture_id]).to include("を入力してください")
      end

      it "発送までの日数がなければ登録できないこと" do
        item = build(:item, preparation_day_id: nil)
        item.valid?
        expect(item.errors[:preparation_day_id]).to include("を入力してください")
      end

      it "販売価格がなければ登録できないこと" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "販売価格がなければ登録できないこと" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "販売価格が299だと登録できないこと" do
        item = build(:item, price: "299")
        item.valid?
        expect(item.errors[:price]).to include("は300以上の値にしてください")
      end

      it "販売価格が１千万だと登録できないこと" do
        item = build(:item, price: "10000000")
        item.valid?
        expect(item.errors[:price]).to include("は9999999以下の値にしてください")
      end
    end
  end