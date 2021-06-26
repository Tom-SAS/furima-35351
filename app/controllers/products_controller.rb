class ProductsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_product, only: [:show, :edit, :update, :move_to_index]
  before_action :move_to_index, except: [:index, :new, :show, :create]

  def index
    @products = Product.order('created_at DESC')
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

  def show
  end

  def edit
  end

  def update
    @product.update(product_params)
    if @product.save
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  private

  def product_params
    params.require(:product).permit(:name, :image, :comment, :category_id, :status_id, :shipment_cost_id, :prefecture_id,
                                    :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    @product = set_product
    redirect_to action: :index unless current_user.id == @product.user.id
  end
end
