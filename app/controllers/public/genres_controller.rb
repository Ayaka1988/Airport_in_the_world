class Public::GenresController < ApplicationController
  def index
    @parents = Genre.where(ancestry: nil)
  end

  def show
    @posts = @genre.set_posts
    @posts = @posts.where(genre_id: nil).order
  end

  def set_genre
    @genre = Genre.find(params[:id])
      if @genre.has_children
        @genre_links = @genre.childern
      else
        @genre_links = @genre.siblings
      end
  end

  private

  # def set_genre
  #   @genre = Genre.find(params[:id])
  # end

  def genre_params
     params.require(:genre).permit(:name, :ancestry)
  end
end

