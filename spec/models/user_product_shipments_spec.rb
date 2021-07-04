require 'rails_helper'

RSpec.describe UserProduct, type: :model do
  before do
    @user_product_shipment = FactoryBot.build(:user_product_shipment)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it '全てのカラムが正常に入力されていれば購入できる' do
        expect(@user_product_shipment).to be_valid
      end
      it '建物名は空でも保存できること' do
        @user_product_shipment.building = ''
        expect(@user_product_shipment).to be_valid
      end
    end
    context '商品購入できない時' do
      it '郵便番号が空では購入できない' do
        @user_product_shipment.post_number = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "Post number can't be blank"
      end
      it '郵便番号はハイフンを含まないと購入できない' do
        @user_product_shipment.post_number = '1234567'
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include 'Post number is invalid. Include hyphen(-)'
      end
      it '県名が空では購入できない' do
        @user_product_shipment.prefecture_id = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空では購入できない' do
        @user_product_shipment.city = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では購入できない' do
        @user_product_shipment.number = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "Number can't be blank"
      end
      it '電話番号が空では購入できない' do
        @user_product_shipment.phone_number = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'tokenが空では購入できない' do
        @user_product_shipment.token = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "Token can't be blank"
      end
      it 'user_idが紐付いてないと購入できない' do
        @user_product_shipment.user_id = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "User can't be blank"
      end
      it 'product_idが紐付いてないと購入できない' do
        @user_product_shipment.product_id = ''
        @user_product_shipment.valid?
        expect(@user_product_shipment.errors.full_messages).to include "Product can't be blank"
      end
    end
  end
end
