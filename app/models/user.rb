class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :todo_lists, dependent: :destroy
  has_many :seller_items, foreign_key: "seller_id", class_name: "Item"
  has_many :buyer_items, foreign_key: "buyer_id", class_name: "Item"
  has_many :user_evaluations
  has_one :point, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_one :sns_authentication, dependent: :destroy
  has_one :sending_destination, dependent: :destroy
  has_one :credit_card, dependent: :destroy
end
