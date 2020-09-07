class Public::OrdersController < ApplicationController

	def new
	  @shipping_address = current_customer.shipping_address
	  @shipping_address = ShippingAddress.new
	end

	def confirm
	end

	def create
	end

	def index
	  @orders = Order.where(customer_id: current_customer.id)
	end

	def show
	  @order = Order.find(params[:id])
	  @order_informations = @order.order_information
	end

	def complete
	end

end
