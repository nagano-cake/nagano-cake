class Admin::CustomersController < ApplicationController
	# before_action :authenticate_admin!
	def index
		@customers = Customer.page(params[:page]).reverse_order
	end

	def show
		@customers = Customer.find(params[:id])
	end

	def edit
		@customers = Customer.find(params[:id])
	end

	def update
		customers = Customer.find(params[:id])
		customers.update(customers_params)
        flash[:notice] = 'customers was successfully updated.'
        redirect_to admin_customer_path(customers)
	end

	# def delete_flag
 #  	@customer = customer.find(params[:id])
	#   	if　@customer.delete_flag?
	#   		@customer.delete_flag = false
	#   	else
	#   		@customer.delete_flag = true
	#   	end
 #  end

private
 def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :phone_number, :encrypted_password, :delete_flag)
  end
end
#モデルが決まってから書く
