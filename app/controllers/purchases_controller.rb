class PurchasesController < ApplicationController
  before_action :authenticate_user!

  def index
    @purchase_shipping = PurchaseShipping.new
    @item = Item.find(params[:item_id])
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def purchase_params
    params.require(:purchase_shipping).permit(:post_code, :region_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def item_params
    params.require(:item).permit(:item_name, :item_description, :item_price, :image, :item_condition_id, :cost_id, :region_id,
                                 :shipping_day_id, :category_id).merge(user_id: current_user.id)
  end
end
