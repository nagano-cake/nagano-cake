class CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @customer = Customer.find(current_customer.id)
    @cart_items = @customer.cart_items
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
       redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    @customer = Customer.find(current_customer.id)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    if cart_item.destroy
       redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy_all
    if current_customer.cart_items.destroy_all
       redirect_to cart_items_path
    else
      render :index
    end
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:count,:product_id)
  end
end
