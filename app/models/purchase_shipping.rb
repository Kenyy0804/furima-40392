class PurchaseShipping
  include ActiveModel::Model
  attr_accessor :post_code, :region_id, :municipalities, :address, :building_name, :phone_number, :purchase_id, :item_id, :user_id, :token

  with_options presence: true do
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/}
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
  end
  validates :region_id, numericality: {other_than: 0}

  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Shipping.create(
      post_code: post_code, region_id: region_id, municipalities: municipalities, address: address,
      building_name: building_name, phone_number: phone_number, purchase_id: purchase.id
    )
    
  end
end