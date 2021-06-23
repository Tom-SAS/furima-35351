require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品できる時' do
      it '全てのカラムが正常に入力されていれば出品できる' do
        expect(@product).to be_valid
      end
    end
    context '商品出品できない時' do
      it '商品画像が空では出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Name can't be blank"
      end
      it '商品の説明が空では出品できない' do
        @product.comment = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Comment can't be blank"
      end
      it '販売価格が空では出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Price can't be blank"
      end
      it '販売価格が300円より小さいと出品できない' do
        @product.price = 100
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be greater than 299'
      end
      it '販売価格が9,999,999円より大きいと出品できない' do
        @product.price = 100_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price must be less than 10000000'
      end
      it '販売価格が半角数字以外だと出品できない' do
        @product.price = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include 'Price is not a number'
      end
      it 'カテゴリーが空では出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Category can't be blank"
      end
      it '配送料の負担が空では出品できない' do
        @product.shipment_cost_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Shipment cost can't be blank"
      end
      it '発送元の地域が空では出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '発送までの日数が空では出品できない' do
        @product.delivery_time_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Delivery time can't be blank"
      end
      it '商品の状態が空では出品できない' do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include "Status can't be blank"
      end
      it 'カテゴリーが--では出品できない' do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Category must be other than 1'
      end
      it '配送料の負担が--では出品できない' do
        @product.shipment_cost_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Shipment cost must be other than 1'
      end
      it '発送元の地域が--では出品できない' do
        @product.prefecture_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Prefecture must be other than 1'
      end
      it '発送までの日数が--では出品できない' do
        @product.delivery_time_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Delivery time must be other than 1'
      end
      it '商品の状態が--では出品できない' do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include 'Status must be other than 1'
      end
    end
  end
end
