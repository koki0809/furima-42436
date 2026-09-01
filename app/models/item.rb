class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :active_storage_blobs
end
