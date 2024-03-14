require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    context '商品出品できるとき' do
      it 'item_nameとitem_description、item_priceとcategoryとitem_conditionとcostとregionとshipping_dayが存在すれば登録できる' do
        
      end
    end
    context '新規登録できないとき' do
      it 'item_nameが空では登録できない' do
      end
      it 'item_descriptionが空では登録できない' do
      end
      it 'categoryが空では登録できない' do
      end
      it 'item_conditionが空では登録できない' do
      end
      it 'costが空では登録できない' do
      end
      it 'regionが空では登録できない' do
      end
      it 'shipping_dayが空では登録できない' do
      end
      it 'item_priceが空では登録できない' do
      end
      it 'item_priceは、半角数値のみ保存可能であること' do
      end
      it 'item_priceは、¥300~¥9,999,999の間のみ保存可能であること。' do
      end
      
end