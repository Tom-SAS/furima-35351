require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it '全てのカラムが記入されていれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない時' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it 'emailに@を含まないと登録できない' do
        @user.email = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it 'emailが一意性ではない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'Email has already been taken'
      end
      it 'passwordが６文字以上ない' do
        @user.password = 'aaaa1'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is too short (minimum is 6 characters)'
      end
      it 'passwordが全角では登録できない' do
        @user.password = 'AAAAAA1'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'passwordに半角英数字が含まれない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'passwordに半角英字が含まれない' do
        @user.password = '1111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Password is invalid'
      end
      it 'password_confirmationが空の場合' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'password_confirmationが一致しない' do
        @user.password = '111aab'
        @user.password_confirmation = '111aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.first_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First name is invalid'
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ）以外では登録できない' do
        @user.last_name = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last name is invalid'
      end
      it 'first_furiganaが全角（カタカナ）以外では登録できない' do
        @user.first_furigana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'First furigana is invalid'
      end
      it 'last_furiganaが全角（カタカナ）以外では登録できない' do
        @user.last_furigana = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last furigana is invalid'
      end
      it 'first_furiganaが空では登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'First furigana is invalid'
      end
      it 'last_furiganaが空では登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include 'Last furigana is invalid'
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
    end
  end
end
