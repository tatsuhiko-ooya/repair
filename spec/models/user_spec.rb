require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'create' do

    before do
      @user = FactoryBot.build(:user)
    end

    context '登録成功' do
      it 'すべての項目を正しく入力すれば新規登録できる' do
        expect(@user).to be_valid
      end
    end

    context '登録失敗' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Eメールを入力してください')
      end
      it 'emailが一意でなければ登録できない' do
        @user.save
        other_user = FactoryBot.build(:user, email: @user.email)
        other_user.valid?
        expect(other_user.errors.full_messages).to include('Eメールはすでに存在します')
      end

      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードを入力してください')
      end
      it 'passwordが５文字以下では登録できない' do
        @user.password = '123ab'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが数字のみでは登録できない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字を混合させてください')
      end
      it 'passwordがアルファベットのみでは登録できない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは英数字を混合させてください')
      end
      it 'passwordとpassword_confirmationが同じ値でなければ登録できない' do
        @user.password = 'password123'
        @user.password_confirmation = '123password'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名を入力してください')
      end
      it 'last_nameがアルファベットでは登録できない' do
        @user.last_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名は平仮名、全角カタカナ、漢字のみ使用可能です。')
      end
      it 'last_nameが数字では登録できない' do
        @user.last_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('姓名は平仮名、全角カタカナ、漢字のみ使用可能です。')
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('名前を入力してください')
      end
      it 'first_nameがアルファベットでは登録できない' do
        @user.first_name = 'abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は平仮名、全角カタカナ、漢字のみ使用可能です。')
      end
      it 'first_nameが数字では登録できない' do
        @user.first_name = '123'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は平仮名、全角カタカナ、漢字のみ使用可能です。')
      end
    end
  end
end
