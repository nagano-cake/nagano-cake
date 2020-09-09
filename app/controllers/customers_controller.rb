class CustomersController < ApplicationController

	before_action :authenticate_customer!

	def show
	  @customer = Customer.find(current_customer.id)
	end

	def edit
	  @customer = Customer.find(current_customer.id)
	end

	def update
	  @customer = Customer.find(current_customer.id)
	   if @customer.update(customer_params)
	     redirect_to customers_my_page_path(@customer)
	   else
	   	  render :edit
	   end
	end

	def unsubscribe
	end

	def withdraw
	  @customer = Customer.find(current_customer.id)
	  @customer.update(delete_flag: true)
	  reset_session
	  redirect_to products_path
	end

	private
	def customer_params
	  params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana,
	  	 :email, :post_code, :phone_number, :address, :encrypted_password, :delete_flag)
    end
end
