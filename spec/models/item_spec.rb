require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it '全ての入力が正しければ出品できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品が出来ない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空では出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryが未選択では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to be_present
      end
      it 'conditionが未選択では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors[:condition_id]).to be_present
      end
      it 'shipping_fee_burdenが未選択では出品できない' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors[:shipping_fee_burden_id]).to be_present
      end
      it 'shipping_originが未選択では出品できない' do
        @item.shipping_origin_id = 1
        @item.valid?
        expect(@item.errors[:shipping_origin_id]).to be_present
      end
      it 'shipping_durationが未選択では出品できない' do
        @item.shipping_duration_id = 1
        @item.valid?
        expect(@item.errors[:shipping_duration_id]).to be_present
      end
      it 'priceが空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors[:price]).to be_present
      end
      it 'priceが9,999,999円より高いと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors[:price]).to be_present
      end
      it '価格に半角数字以外が含まれている場合は出品できない' do
        @item.price = 'abc123'
        @item.valid?
        expect(@item.errors[:price]).to be_present
      end
      it '出品者が紐付いていない場合は出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors[:user]).to be_present
      end
    end
  end
end
