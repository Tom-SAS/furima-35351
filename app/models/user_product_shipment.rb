class UserProductShipment
  include ActiveModel::Model
  attr_accessor :post_number, :prefecture_id, :city, :number, :building, :phone_number, :token, :user_id, :product_id

  with_options presence: true do
    validates :post_number, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :number
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    @user_product = UserProduct.create(product_id: product_id, user_id: user_id)
    Shipment.create(post_number: post_number, prefecture_id: prefecture_id, city: city, number: number,
                    building: building, phone_number: phone_number, user_product_id: @user_product.id)
  end
end
