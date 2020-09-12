class OrdersController < ApplicationController
	before_action :authenticate_customer!
	before_action :set_customer

	def new
	  @order = Order.new
	  @shipping_addresses = ShippingAddress.where(customer_id: current_customer.id)
	end

	def create
	  if current_customer.cart_items.exists?
	  	@order = Order.new(order_params)
	  	@order.customer_id = current_customer.id
	  	@shipping_address = @customer.shipping_addresses

	  	# 住所
	  	@add = params[:order][:add].to_i
	  	case @add
	  	  when 1
	  	  	@order.post_code = @customer.post_code
	  	  	@order.address = @customer.address
	  	  	@order.name = @customer.name
	  	  when 2
	  	  	@order.post_code = params[:order][:post_code]
	  	  	@order.address = params[:order][:shipping_address]
	  	  	@order.name = params[:order][:name]
	  	  when 3
	  	  	@order.post_code = params[:order][:post_code]
	  	  	@order.address = params[:order][:shipping_address]
	  	  	@order.name = params[:order][:name]
	  	end
	  	sum = 0
	  	cart_items = current_customer.cart_items
	  	 cart_items.each do |cart_item|
	  	  sum += cart_item.product.price * 1.1 * cart_item.count
	  	 end
	  	 # price_include_tax(cart_item.product.price)
	  	 sum += @order.postage
	  	@order.billing = sum
	  	# binding.pry
	  	@order.save
	  	# binding.pry
	  	# 住所検索をし、データがなければ新規登録
	    # if ShippingAddress.find_by(shipping_address: @order.address).nil?
	      # @shipping_address = ShippingAddress.new
	      # @shipping_address.post_code = @order.address
	      # @shipping_address.name = @order.name
	      # @shipping_address.customer_id = current_customer.id
	    # end

	    # カートアイテムを注文情報に新規登録
	    current_customer.cart_items.each do |cart_item|
	      order_information = @order.order_informations.new
	      order_information.order_id = @order.id
	      order_information.product_id = cart_item.product_id
	      order_information.count = cart_item.count
	      order_information.price = cart_item.product.price
	      order_information.save
	      cart_item.destroy
	    end
	    redirect_to orders_complete_path
	  else
	  	redirect_to root_path
	  end
	end

	def confirm
	  @order =Order.new(order_params)
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
	  # @orders = Order.where(customer_id: current_customer.id)
	  @orders = @customer.orders
	end

	def show
	  @order = Order.find(params[:id])
	  @order_informations = @order.order_informations

	  sum = 0
	  @order_informations.each do |order_information|
	  sum += order_information.price * 1.1 * order_information.count
	  end
	  @goukei = sum.to_i
	end

	def complete
	end

	private
	def set_customer
	  @customer = current_customer
	end

	def order_params
	  params.require(:order).permit(:postage, :billing, :payment_method, :name, :address, :post_code, :status,
	  	order_informations_attributes: [:order_id, :product_id, :count, :price, :status]
	  	)
	end

	def order_information_params
	  params.require(:order_information).permit(:order_id, :product_id, :count, :price, :status)
	end

end
