class UserProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product
  before_action :move_to_index

  def index
    @user_product_shipment = UserProductShipment.new
  end

  def create
    @user_product_shipment = UserProductShipment.new(user_product_shipment_params)
    if @user_product_shipment.valid?
      pay_item
      binding.pry
      @user_product_shipment.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_product_shipment_params
    params.require(:user_product_shipment).permit(:post_number, :prefecture_id, :city, :number, :building, :phone_number)
          .merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: user_product_shipment_params[:token], 
      currency: 'jpy'         
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end

  def move_to_index
    redirect_to controller: :products, action: :index if current_user.id == @product.user_id || @product.user_product.present?
  end
end
