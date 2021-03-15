require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    describe 'アイテム新規登録' do
    context '商品が新規登録できる時' do
      it '写真が投稿されていれば登録できる' do
        expect(@item).to be_valid
      end
    end

      
    context '商品が新規登録できない時' do
      it '写真が投稿されていないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空だと登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品の説明文が空だと登録できない' do
        @item.comment = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Comment can't be blank")
      end
      it '商品カテゴリーのidが1の時は登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it '商品の状態のidが1の時は登録できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition is not a number")
      end
      it '発送料の負担のidが1の時は登録できない'do 
        @item.shipping_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping is not a number")
      end
      it '発送元の地域のidが1の時は登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area is not a number")
      end
      it '発送までの日数のidが1の時は登録できない'do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge is not a number")
      end
      it '販売価格が空だと登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '販売価格が300円以下だと登録できない' do
        @item.item_price = 100
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it '販売価格が10000000円以上だと登録できない' do
        @item.item_price = 10000001
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Out of setting range")
      end
      it '販売価格が数字以外だと登録できない' do
        @item.item_price = '五百円'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it '販売価格が全角文字だと登録できない' do
        @item.item_price = 'ごひゃくえん'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it '販売価格が半角英数字混合だと登録できない' do
        @item.item_price = '5000a'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it '販売価格が半角英語だと登録できない' do
        @item.item_price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
      it '販売価格が全角の数字だと登録できない' do
        @item.item_price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price Half-width number")
      end
    end
  end
end

