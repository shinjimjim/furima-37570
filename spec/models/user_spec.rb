require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nicknameが空だと保存できないこと' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと保存できないこと' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'すでに登録されたemailと同じだと保存できないこと' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it '@が含まれないemailだと保存できないこと' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'passwordが空だと保存できないこと' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと保存できないこと' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが半角数字のみでは保存できないこと' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumerical characters.")
      end
      it 'passwordが半角英字のみでは保存できないこと' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumerical characters.")
      end
      it 'passwordが全角では保存できないこと' do
        @user.password = '１１１ａａａ'
        @user.password_confirmation = '１１１ａａａ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid. Input half-width alphanumerical characters.")
      end
      it 'passwordとpassword_confirmationが同じ値でないと保存できないこと' do
        @user.password = '123456'
        @user.password_confirmation = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'lastnameが空だと保存できないこと' do
        @user.lastname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname can't be blank")
      end
      it 'lastnameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
        @user.lastname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname is invalid. Input full-width characters.")
      end
      it 'firstnameが空だと保存できないこと' do
        @user.firstname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end
      it 'firstnameが全角（漢字・ひらがな・カタカナ）でないと保存できないこと' do
        @user.firstname = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname is invalid. Input full-width characters.")
      end
      it 'lastname_readingが空だと保存できないこと' do
        @user.lastname_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname reading can't be blank")
      end
      it 'lastname_readingが全角（カタカナ）でないと保存できないこと' do
        @user.lastname_reading = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Lastname reading is invalid. Input full-width katakana characters.")
      end
      it 'firstname_readingが空だと保存できないこと' do
        @user.firstname_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname reading can't be blank")
      end
      it 'firstname_readingが全角（カタカナ）でないと保存できなこと' do
        @user.firstname_reading = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname reading is invalid. Input full-width katakana characters.")
      end
      it '生年月日が空だと保存できないこと' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
