class ProductsController < ApplicationController

	def top
		@genres = Genre.all
		@products = Product.all
	end

	def index
		@genres = Genre.all
		@products = Product.where(status: true).page(params[:page]).per(8)
	end

	def show
		@products = Product.all
 		@product = Product.find(params[:id])
    	@cart_item = CartItem.new
	end

private
	def product_params
		parmas.require(:product).permit(:name ,:iamge, :text, :price, :status)
	end
end