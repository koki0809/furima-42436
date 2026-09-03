class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :active_storage_blobs
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_duration
  belongs_to :shipping_fee_burden
  belongs_to :shipping_origin

  validates :name, presence: true
  validates :description, presence: true
  validates :category, numericality: { other_than: 1 }
  validates :condition, numericality: { other_than: 1 }
  validates :shipping_duration, numericality: { other_than: 1 }
  validates :shipping_fee_burden, numericality: { other_than: 1 }
  validates :shipping_origin, numericality: { other_than: 1 }
  validates :price, presence: true, format: { with: /\A[0-9]+\z/, message: "is invalid" }, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
