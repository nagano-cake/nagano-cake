class ShippingAddressesController < ApplicationController

#ログインユーザーのみ
 #before_action :authenticate_customer!

	def index
		@customer = current_customer
		@shipping_addresses = @customer.shipping_address
  		@shipping_address = ShippingAddress.newx
	end

	def edit
		@shipping_address = ShippingAddress.find(params[:id])
	end

	def create
		@shipping_address = ShippingAddress.new(shipping_address_params)
		@shipping_address.customer_id = current_customer.id
		@shipping_addresses = current_customer.shipping_address
		if
 		@shipping_address.save
		flash.now[:notice] = "新規配送先を登録しました"
		end
	end

	def update
		@shipping_address = ShippingAddress.find(params[:id])
	 if
	 	@shipping_address.update(shipping_address_params)
		flash[:success] = "配送先を変更しました"
		redirect_to shipping_addresses_path
	else
		render "edit"
	 end
	end

	def destroy
		@shipping_address = ShippingAddress.find(params[:id])
		@shipping_address.destroy
		@shipping_addresses = current_customer.shipping_address
		flash.now[:alert] = "配送先を削除しました"
	end
end

private
	def shipping_address_params
		params.require(:shiping_address).permit(:user_id, :destination, :address, :post_code)
	end