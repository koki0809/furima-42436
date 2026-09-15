class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image
  
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_duration
  belongs_to :shipping_fee_burden
  belongs_to :shipping_origin

  validates :image, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_duration_id, numericality: { other_than: 1 }
  validates :shipping_fee_burden_id, numericality: { other_than: 1 }
  validates :shipping_origin_id, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "is invalid" }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
