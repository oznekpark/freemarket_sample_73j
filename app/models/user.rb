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

  VALID_NAME_REGEX = /\A[一-龥ぁ-ん]/
  VALID_KANA_REGEX = /\A[ぁ-んー－]+\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :nickname,           presence: true
  validates :first_name,         presence: true, format: { with: VALID_NAME_REGEX }
  validates :family_name,        presence: true, format: { with: VALID_NAME_REGEX }
  validates :first_name_kana,    presence: true, format: { with: VALID_KANA_REGEX }
  validates :family_name_kana,   presence: true, format: { with: VALID_KANA_REGEX }
  validates :email,              presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,           presence: true, length: { minimum: 7 }
  validates :encrypted_password, presence: true, length: { minimum: 7 }
  validates :birth_year,         presence: true
  validates :birth_month,        presence: true
  validates :birth_day,          presence: true
end
