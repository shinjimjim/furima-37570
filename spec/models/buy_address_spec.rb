require 'rails_helper'

RSpec.describe BuyAddress, type: :model do
  describe '配送先情報の保存' do
    before do
      @buy_address = FactoryBot.build(:buy_address)
    end

    context '内容に問題がない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_address).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @buy_address.building_name = ''
        expect(@buy_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buy_address.postal_code = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_address.postal_code = '1234567'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @buy_address.prefecture_id = '1'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @buy_address.city = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空だと保存できないこと' do
        @buy_address.house_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("House number can't be blank")
      end
      it 'telephone_numberが空だと保存できないこと' do
        @buy_address.telephone_number = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number can't be blank")
      end
      it 'telephone_numberにハイフンがあると保存できないこと' do
        @buy_address.telephone_number = '090-1234-5678'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'telephone_numberが12桁以上あると保存できないこと' do
        @buy_address.telephone_number = '090123456789'
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Telephone number is invalid")
      end
      it 'userが紐付いていないと保存できないこと' do
        @buy_address.user_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @buy_address.item_id = nil
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'トークンが空だと保存できないこと' do
        @buy_address.token = ''
        @buy_address.valid?
        expect(@buy_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
