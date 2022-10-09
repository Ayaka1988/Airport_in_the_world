class Public::PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      PostGenre.maltilevel_genre_create(
        @post,
        params[:parent_id],
        params[:children_id],
        params[:grandchildren_id]
      )
      redirect_to posts_path
    else
      @posts = Post.all
      @genre_parent_array = Genre.genre_parent_array_create
      render 'index'
    end
  end

  def index
    # byebug
    @post = Post.new
    @posts = Post.all
    @genre_parent_array = Genre.genre_parent_array_create
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
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :airport_name, :open_hour, :sleep_space, :security, :url, :others, :title, :body, { genre_ids: [] })
  end

end
