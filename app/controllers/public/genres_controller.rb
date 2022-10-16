class Public::GenresController < ApplicationController
  def index
    @parents = Genre.where(ancestry: nil)
    @genres = Genre.find_by(ancestry: nil).children
  end

  def to_country
   country_id = params[:country_id]
   redirect_to "/posts/country/#{country_id}"
  end

  def new
    @genres = Genre.find_by(ancestry: nil).children
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

  #選択された親カテゴリーに紐付く子カテゴリーを抽出
  def get_genre_children
    @genre_children = Genre.find(params[:parent_id]).children
  end
  #選択された子カテゴリーに紐付く孫カテゴリーを抽出
  def get_genre_grandchildren
    @genre_grandchildren = Genre.find(params[:children_id]).children
  end

  private

  def genre_params
     params.require(:genre).permit(:name, :ancestry)
  end
end

