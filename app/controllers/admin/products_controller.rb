class Admin::ProductsController < ApplicationController
	before_action :authenticate_admin!
	def new
		@product = Product.new
    end

    def show
    	@product = Product.find(params[:id])
    end

    def edit
    	@product = Product.find(params[:id])
    end

    def index
   		@products = Product.page(params[:page]).reverse_order
    end

    def create
	    @product = Product.new(product_params)
		if  @product.save!
		    flash[:notice] = 'Product was successfully created.'
		    redirect_to admin_product_path(@product)
	    else
	    	flash[:notice] = 'Product was not successfully created.'
	    	render :new
	    end
	end

    def update
	    product = Product.find(params[:id])
	    product.update(product_params)
	    flash[:notice] = 'product was successfully updated.'
	    redirect_to admin_product_path(product)
	end

	private
    def product_params
      params.require(:product).permit(:name, :image, :text, :price, :status, :genre_id)
    end
end
