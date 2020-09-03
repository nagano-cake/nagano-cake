class Public::CustomersController < ApplicationController

	def show
	  @customer = Customer.find(current_user.id)
	end

	def edit
	  @customer = Customer.find(current_user.id)
	end

	def update
	  @customer = Customer.find(current_user.id)
	  @customer.update(customer_params)
	  redirect_to customers_my_page_path
	end

	def unsubscribe
	end

	def withdraw
	　
	end

end
