require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

   describe 'ユーザー新規登録' do
     context '新規登録できるとき' do
       it '名前が入力されていれば登録できる' do
         expect(@user).to be_valid
       end
        it 'nicknameが入力されていれば登録できる' do
          @user.nickname = 'aaaa'
          expect(@user).to be_valid
        end
        it '誕生日が入力されていれば登録できる' do
          @user.birthday = '2000-01-01'
          expect(@user).to be_valid
        end
       it 'emailが入力されていれば登録できる' do
          @user.email = 'test@gmail.com'
          expect(@user).to be_valid
        end
        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '12aaaaaa'
           @user.password_confirmation = '12aaaaaa'
          expect(@user).to be_valid
        end
        it 'passwordは半角英数字の入力があれば登録できる' do
          @user.password = '12aaaaaa'
          @user.password_confirmation = '12aaaaaa'
          expect(@user).to be_valid
      end
   end

  context '新規登録できないとき' do
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it '振り仮名が空だと登録できない' do
      @user.first_name_kana = ''
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it '誕生日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'emailが空では登録出来ない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailは＠が入っていないと登録できない' do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordは6文字以上でなければ登録できない' do
      @user.password = 'aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは半角英数字の入力がなければ登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordは確認用と一致していないと登録できない' do
      @user.password = '1aaaaaa'
      @user.password_confirmation = '1aaaaab'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '1234'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'Aaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
    end
  end
end
end