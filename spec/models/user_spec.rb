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
    it '苗字が空では登録できない' do
      @user.family_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字を入力してください")
    end
    it '苗字が平仮名・片仮名・漢字以外では登録できない' do
      @user.family_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字は不正な値です")
    end
    it '名前が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it '名前が平仮名・片仮名・漢字以外では登録できない' do
      @user.first_name = '1'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前は不正な値です")
    end
    it '苗字の振り仮名が空だと登録できない' do
      @user.family_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のカタカナを入力してください")
    end
    it '苗字の振り仮名が半角だと登録できない' do
      @user.family_name_kana = 'ｷｼﾉ'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のカタカナは不正な値です")
    end
    it '苗字の振り仮がカタカナ以外の全角だと登録できない' do
      @user.family_name_kana = 'きしの'
      @user.valid?
      expect(@user.errors.full_messages).to include("苗字のカタカナは不正な値です")
    end
    it '名前の振り仮名が空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のカタカナを入力してください")
    end
    it '名前の振り仮名が半角だと登録できない' do
      @user.first_name_kana = 'ﾃﾂﾔ'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のカタカナは不正な値です")
    end
    it '名前の振り仮がカタカナ以外の全角だと登録できない' do
      @user.first_name_kana = 'てつや'
      @user.valid?
      expect(@user.errors.full_messages).to include("名前のカタカナは不正な値です")
    end
    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it '誕生日が空では登録できない' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("生年月日を入力してください")
    end
    it 'emailが空では登録出来ない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailが重複していると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
    end
    it 'emailは＠が入っていないと登録できない' do
      @user.email = 'testgmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールは不正な値です")
    end
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordは5文字以下だと登録できない' do
      @user.password = 'aa111'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
    end
    it 'passwordは半角英数字の入力がなければ登録できない' do
      @user.password = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it 'passwordは確認用と一致していないと登録できない' do
      @user.password = '1aaaaaa'
      @user.password_confirmation = '1aaaaab'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
    end
    it 'passwordは数字のみでは登録できない' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
    it 'passwordは全角では登録できない' do
      @user.password = 'AAaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードには英字と数字の両方を含めて設定してください")
    end
   end
  end
end
