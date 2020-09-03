class Admin::CustomersController < ApplicationController
	def index
		@customers = Customers.page(params[:page]).reverse_order
	end

	def show
		@customers = Customers.find(params[:id])
	end

	def edit
		@customers = Customers.find(params[:id])
	end

	def update
		customers = Customers.find(params[:id])
		customers.update(customers_params)
        flash[:notice] = 'customers was successfully updated.'
        redirect_to admin_customer_path(customers)
	end

	def delete_flag
  	@customer = customer.find(params[:id])
	  	if　@customer.delete_flag?
	  		@customer.delete_flag = false
	  	else
	  		@customer.delete_flag = true
	  	end
  end
end


private
 def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postal_code, :phone_number, :encrypted_password, :delete_flag)
  end
end
#モデルが決まってから書く
