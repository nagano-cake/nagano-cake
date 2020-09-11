class ShippingAddressesController < ApplicationController
    before_action :authenticate_customer!

	  def index
  		@shipping_address = ShippingAddress.new
  		@shipping_addresses = current_customer.shipping_addresses.page(params[:page]).per(3) # ページネーションの追加/3件ごとにページ作成
  	end

  	def create
  		@shipping_address = current_customer.shipping_addresses.new(shipping_address_params)
  		# @shipping_address.costomer_id = current_customer.id
  		@shipping_address.save
  		redirect_to shipping_addresses_path
  	end

  	def edit
  		@shipping_address = ShippingAddress.find(params[:id])
  	end

  	def update
  		@shipping_address = ShippingAddress.find(params[:id])
  		@shipping_address.update(shipping_address_params)
  		redirect_to shipping_addresses_path
  	end

  	def destroy
  		@shipping_address = ShippingAddress.find(params[:id])
  		@shipping_address.destroy
  		redirect_to shipping_addresses_path
  	end

  private
  	def shipping_address_params
  		params.require(:shipping_address).permit(:destination, :customer_id, :address, :post_code)
  	end
end