class Admin::CustomersController < ApplicationController
	# before_action :authenticate_admin!
	def index
		@customers = Customer.all
	end

	def show
		@customer = Customer.find(params[:id])
	end

	def edit
		@customer = Customer.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
        flash[:notice] = 'customers was successfully updated.'
        redirect_to admin_customers_path
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
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :post_code, :telephone_number, :encrypted_password, :delete_flag, :address)
  end
end
#モデルが決まってから書く
