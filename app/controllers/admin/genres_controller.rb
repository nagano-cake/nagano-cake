class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
	def index
	    @genre = Genre.new
	    @genres = Genre.page(params[:page]).reverse_order
    end

    def create
    	@genre = Genre.new(genre_params)
	    if  @genre.save
	    	  flash[:notice] = 'genre was successfully created.'
	      	redirect_to admin_genres_path
	    else
	    	render "index"
	    end
    end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if  @genre.update(genre_params)
    	flash[:notice] = 'genre was successfully updated.'
      redirect_to admin_genres_path
    else
      render "edit"
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name, :vaild_flag)
  end
end
