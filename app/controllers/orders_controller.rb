class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def new
	  @order = Order.new
	end

	def confirm
	end

	def create
	end

	def index
	  @orders = Order.where(customer_id: current_customer.id)
	  # @orders = @customer.orders
	end

	def show
	  @order = Order.find(params[:id])
	  @order_informations = @order.order_information
	end

	def complete
	end

	private
	def set_customer
	  @customer = current_customer
	end

	def order_params
	  params.require(:order).permit(:postage, :billing, :payment_method, :name, :address, :post_code, :status, :created_at)
	end

end
