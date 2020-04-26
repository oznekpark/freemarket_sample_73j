class Item < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :todo_lists
  has_many :seller_items, foreign_key: "seller_id", class_name: "Item"
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :user_evaluations
  has_many :item_imgs, dependent: :destroy
	accepts_nested_attributes_for :item_imgs, allow_destroy: true
  has_one :point
  has_one :profile, dependent: :destroy
  has_one :sns_authentication, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  has_one :credit_card, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :postage_type
  belongs_to_active_hash :preparation_day
end
