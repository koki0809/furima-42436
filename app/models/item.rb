class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :active_storage_blobs
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_duration
  belongs_to :shipping_fee_burden
  belongs_to :shipping_origin
end
