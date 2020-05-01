class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :item_imgs, dependent: :destroy
  accepts_nested_attributes_for :item_imgs, allow_destroy: true
  has_one :user_evaluation

  belongs_to :category, optional: true 
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional: true

  
  belongs_to_active_hash :size
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :brand
  belongs_to_active_hash :prefecture

  validates :item_imgs,           presence: true
  validates :name,                presence: true, length: { maximum: 40 }
  validates :introduction,        presence: true, length: { maximum: 1000 }
  validates :category_id,         presence: true
  validates :item_condition_id,   presence: true
  validates :postage_payer_id,    presence: true
  validates :prefecture_id,       presence: true
  validates :preparation_day_id,  presence: true
  validates :price,               presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :seller_id,           presence: true
  validates :size_id,             presence: true
  validates :postage_type_id,     presence: true
end
