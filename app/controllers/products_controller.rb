class ProductsController < ApplicationController

def top
		@genres = Genre.all

	if params[:genre_id]
  		# urlにgenre_id(params)がある場合
	   genre = Genre.find(params[:genre_id])
  	   @products = genre.products

  	else
  		@products = Product.all
  		 # genre_idが無いなら投稿すべてを取得
	end

end

	def index
		@genres = Genre.all
		@products = Product.where(status: true).page(params[:page]).per(8)
	end

	def show
		@genres = Genre.all
		@product = Product.find(params[:id])
	end

private
	def product_params
		parmas.require(:product).permit(:name ,:iamge, :text, :price, :status)
	end
end