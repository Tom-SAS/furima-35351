class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    # @products = Product.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :comment, :category_id, :status_id, :shipment_cost_id, :prefecture_id,
                                    :delivery_time_id, :price).merge(user_id: current_user.id)
  end
end
