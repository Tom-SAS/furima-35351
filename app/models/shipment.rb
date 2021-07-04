class Shipment < ApplicationRecord
  attr_accessor :token

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
  belongs_to :user_product
end
