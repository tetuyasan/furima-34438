require 'rails_helper'

RSpec.describe BuySend, type: :model do
    before do
      @item = FactoryBot.build(:buy_send)
    end

    describe 'アイテム新規登録' do
    context '商品が購入できる時' do
      it '郵便番号が登録されていれば購入できる' do
        expect(@item).to be_valid
      end
    end

  context '商品が新規登録できない時' do
    it '郵便番号が登録されていないと購入できない' do
      @item.post_number = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Post number can't be blank")
    end
    it '郵便番号にハイフンが入っていないと購入できない' do
      @item.post_number = '1234567'
      @item.valid?
      expect(@item.errors.full_messages).to include("Post number is invalid")
    end
    it '市区町村が空だと登録できない' do
      @item.city = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("City can't be blank")
    end
    it '番地情報が空だと購入できない' do
      @item.address = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Address can't be blank")
    end
    it '電話番号が入力されていないと購入できない' do
      @item.phone_number = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Phone number can't be blank")
    end
    it '電話番号が11桁以上だと購入できない' do
      @item.phone_number = "090123456789"
      @item.valid?
      expect(@item.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end
    it "tokenが空では登録できないこと" do
      @item.token = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Token can't be blank")
    end
   end
  end
end

