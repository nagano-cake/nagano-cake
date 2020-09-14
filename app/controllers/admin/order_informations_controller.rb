class Admin::OrderInformationsController < ApplicationController
		before_action :authenticate_admin!
	def update
  		@order_information = OrderInformation.find(params[:id])
  		#@order_informations = @order.order_informations
  		@order_information.update(order_information_params)
  		redirect_to admin_orders_path
  	end


private
  	def order_information_params
	    params.require(:order_information).permit(:count, :price, :status)
	  end
end
