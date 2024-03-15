require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品出品できるとき' do
      it 'item_nameとitem_description、item_priceとcategoryとitem_conditionとcostとregionとshipping_dayが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'item_nameが空では登録できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end

      it 'item_descriptionが空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end

      it 'categoryが空では登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it 'item_conditionが空では登録できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Item condition must be other than 1")
      end

      it 'costが空では登録できない' do
        @item.cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Cost must be other than 1")
      end

      it 'regionが空では登録できない' do
        @item.region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Region must be other than 1")
      end

      it 'shipping_dayが空では登録できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it 'item_priceが空では登録できない' do
        @item.item_price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end

      it 'item_priceは、半角数値のみ保存可能であること' do
        @item.item_price = '１０００' # 全角数字
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price is not a number")
      end

      it 'item_priceは、¥300~¥9,999,999の間のみ保存可能であること。' do
        @item.item_price = 299 # 300未満
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be greater than or equal to 300")

        @item.item_price = 10_000_000 # 1000万以上
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price must be less than or equal to 9999999")
      end
    end
  end
end

