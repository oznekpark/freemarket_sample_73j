class ItemImg < ApplicationRecord
  belongs_to :item
  mount_uploader :url, ImageUploader
end
