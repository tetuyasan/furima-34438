require 'rails_helper'

RSpec.describe BuyHouse, type: :model do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      sleep 1
      @buyhouse = FactoryBot.build(:buy_house, item_id: @item.id, user_id: @user.id)
    end

    describe 'アイテム新規登録' do
    context '商品が購入できる時' do
      it '郵便番号が登録されていれば購入できる' do
        expect(@buyhouse).to be_valid
      end
      it '建物名が空でも購入できる' do
        @buyhouse.building = '' 
        expect(@buyhouse).to be_valid
      end
    end

  context '商品が新規登録できない時' do
    it '郵便番号が登録されていないと購入できない' do
      @buyhouse.post_number = ''
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Post number can't be blank")
    end
    it '郵便番号にハイフンが入っていないと購入できない' do
      @buyhouse.post_number = '1234567'
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Post number is invalid")
    end
    it '市区町村が空だと登録できない' do
      @buyhouse.city = ''
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("City can't be blank")
    end
    it '番地情報が空だと購入できない' do
      @buyhouse.address = ''
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が入力されていないと購入できない' do
      @buyhouse.phone_number = ''
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が11桁以上だと購入できない' do
      @buyhouse.phone_number = "090123456789"
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it '電話番号が全角数字だと購入できない' do
      @buyhouse.phone_number = "０９０123456789"
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Phone number is not a number")
    end
    it '電話番号が半角数字のみでないと購入できない' do
      @buyhouse.phone_number = "ab0123456789"
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Phone number is not a number")
    end
    it "tokenが空では登録できないこと" do
      @buyhouse.token = nil
      @buyhouse.valid?
      expect(@buyhouse.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end

