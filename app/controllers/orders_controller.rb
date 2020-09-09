class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def new
	  @order = Order.new
	end

	def create
	  if current_customer.cart_items.exists?
	  	@order = Order.new(order_params)
	  	@order.customer_id = current_customer.id

	  	# 住所
	  	@add = params[:order][:add].to_i
	  	case @add
	  	  when 1
	  	  	@order.post_code = @customer.post_code
	  	  	@order.address = @customer.address
	  	  	@order.name = @customer.name
	  	  when 2
	  	  	@order.post_code = params[:order][:post_code]
	  	  	@order.address = params[:order][:address]
	  	  	@order.name = params[:order][:name]
	  	  when 3
	  	  	@order.post_code = params[:order][:post_code]
	  	  	@order.address = params[:order][:address]
	  	  	@order.name = params[:order][:name]
	  	end
	  	@order.save

	  	# 住所検索をし、データがなければ新規登録
	    if ShippingAddress.find_by(address: @order.address).nil?
	      @shipping_address = ShippingAddress.new
	      @shipping_address.post_code = @order.address
	      @shipping_address.name = @order.name
	      @shipping_address.customer_id = current_customer.id
	    end

	    # カートアイテムを注文情報に新規登録
	    current_customer.cart_items.each do |cart_item|
	      order_information = @order.order_informationscart.new
	      order_information.order_id = @order.id
	      order_information.product_id = cart_item.product_id
	      order_information.count = cart_item.count
	      order_information.price = cart_item.product.price
	      order_information.save
	      cart_item.destroy
	    end
	    render :complete
	  else
	  	redirect_to root_path
	  end
	end

	def confirm
	  @order =Order.new
	  @cart_items = current_customer.cart_items
	  @order.payment_method = params[:order][:payment_method]

	  @add = params[:order][:add].to_i
	  case @add
	    when 1
	      @order.post_code = @customer.post_code
	      @order.address = @customer.address
	      @order.name = @customer.last_name + @customer.first_name
	    when 2
	      @reg = params[:order][:address].to_i
	      @address = ShippingAddress.find(@reg)
	      @order.post_code = @address.post_code
	      @order.address = @address.address
	      @order.name = @address.destination
	    when 3
	      @order.post_code = params[:order][:new_add][:post_code]
	      @order.address = params[:order][:new_add][:address]
	      @order.name = params[:order][:new_add][:name]
	  end
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
	  params.require(:order).permit(:postage, :billing, :payment_method, :name, :address, :post_code, :status, :created_at,
	  	order_informations_attributes: [:order_id, :product_id, :count, :price, :status]
	  	)
	end

end
