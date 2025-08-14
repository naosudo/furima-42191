class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :payment
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  belongs_to :user
  has_one_attached :image


  validates :name, :image, :price, :description, :category_id, :status_id, :payment_id, :prefecture_id, :day_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :status_id
    validates :payment_id
    validates :prefecture_id
    validates :day_id
  end
end