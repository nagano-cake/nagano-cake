class Admin::OrderDetailsController < ApplicationController
	# before_action :authenticate_admin!
	def update
  		@order = Order.find(params[:id])
  		order_details = @order.order_details
  		order_details.update(order_details_params)
  		redirect_to admin_order_path(@order)
  	end


private
  	def order_detail_params
	params.require(:order_details).permit(:status)
	end
end
