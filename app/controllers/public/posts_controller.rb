class Public::PostsController < ApplicationController

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

  #new
  def new
    @post = Post.new
    @genres = Genre.find_by(ancestry: nil).children
    # grandchild_genre = @post.genre
    # child_genre = grandchild_genre.parent
    # @genre_parent_array = []
    # Genre.where(ancestry: nil).each do |parent|
    #   @genre_parent_array << parent.name
    # end

    # @genre_children_array = []
    # Genre.where(ancestry: child_genre.ancestry).each do |children|
    #   @genre_children_array << children
    # end

    # @genre_grandchildren_array = []
    # Genre.where(ancestry: grandchild_genre.ancestry).each do |grandchildren|
    #   @genre_grandchildren_array << grandchildren
    # end
  end


  def edit
  end

  def update
  end

  def index
    @posts = Post.all
    # # byebug
    # @post = Post.new
    # @posts = Post.all
    # @genres = Genre.find_by(ancestry: nil).children
    # @genre_parent_array = Genre.genre_parent_array_create
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
    params.require(:post).permit(:airport_name, :open_hour, :sleep_space, :security, :url, :others, :genre_id).merge(user_id: current_user.id)
  end

end
