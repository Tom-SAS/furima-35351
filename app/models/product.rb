class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :status
  belongs_to :shipment_cost
  belongs_to :prefecture
  belongs_to :delivery_time
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :user
    validates :name
    validates :comment
    validates :price
    validates :status_id
    validates :category_id
    validates :shipment_cost_id
    validates :prefecture_id
    validates :delivery_time_id
  end
  with_options numericality: { other_than: 1 } do
    validates :status_id
    validates :category_id
    validates :shipment_cost_id
    validates :prefecture_id
    validates :delivery_time_id
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10_000_000 }
  validates :price, format: { with: /\A[0-9]+\z/ }
end
