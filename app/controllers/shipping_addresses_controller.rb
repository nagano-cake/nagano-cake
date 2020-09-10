class ShippingAddressesController < ApplicationController
    before_action :authenticate_customer!

	  def index
  		@address = ShippingAddress.new
  		@addresses = current_customer.shipping_addresses.page(params[:page]).per(3) # ページネーションの追加/3件ごとにページ作成
  	end

  	def create
  		@address = ShippingAddress.new(address_params)
  		@address.costomer_id = current_customer.id
  		@address.save
  		redirect_to shipping_addresses_path
  	end

  	def edit
  		@address = ShippingAddress.find(params[:id])
  	end

  	def update
  		@address = ShippingAddress.find(params[:id])
  		@address.update(shipping_address_params)
  		redirect_to shipping_addresses_path
  	end

  	def destroy
  		@address = ShippingAddress.find(params[:id])
  		@address.destroy
  		redirect_to sihpping_addresses_path
  	end

  private
  	def shipping_address_params
  		params.require(:shipping_address).permit(:name, :customer_id, :shipping_address, :post_code)
  	end
end