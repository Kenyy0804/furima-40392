class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :cost
  belongs_to :region
  belongs_to :shipping_day

  validates :item_name, presence: true
  validates :item_description, presence: true
  validates :item_price, presence: true, numericality: {
    greater_than_or_equal_to: 300,
    less_than_or_equal_to: 9999999 }, format: { with: /\A[0-9]+\z/ }
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :cost_id, presence: true, numericality: { other_than: 1 }
  validates :region_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_day_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true
end
