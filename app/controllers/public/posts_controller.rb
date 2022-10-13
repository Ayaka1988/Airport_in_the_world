class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    # # byebug
    # @post = Post.new
  end

  def show
    # byebug
    @post =Post.find(params[:id])
    # @genres = Genre.find_by(ancestry: nil).children
    # @post = @genres
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      @genres = Genre.find_by(ancestry: nil).children
      render :new
    end
  end

  def new
    @post = Post.new
    @genres = Genre.find_by(ancestry: nil).children
    # grandchild_genre = @post.genre
    # child_genre = grandchild_genre.parent
  end

  def edit
  end

  def update
  end

  #選択された親カテゴリーに紐付く子カテゴリーを抽出
  def get_genre_children
    @genre_children = Genre.find(params[:parent_id]).children
  end
  #選択された子カテゴリーに紐付く孫カテゴリーを抽出
  def get_genre_grandchildren
    @genre_grandchildren = Genre.find(params[:children_id]).children
  end

  def destroy
    @posts.destroy
    redirect_to root_path
  end

  def area
    byebug
  end

  private

  def post_params
    params.require(:post).permit(:airport_name, :open_hour, :sleep_space, :security, :url, :others, :genre_id, :image).merge(user_id: current_user.id)
  end

end
