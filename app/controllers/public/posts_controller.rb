class Public::PostsController < ApplicationController

  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    @genres = Genre.find_by(ancestry: nil).children
  end

  def show
    @post =Post.find(params[:id])
    @comment = Comment.new
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
  end

  def edit
    @post =Post.find(params[:id])
    @genres = Genre.find_by(ancestry: nil).children
    unless @post.user == current_user
    redirect_to  edit_post_path
    end
  end

  def update
    @post =Post.find(params[:id])
    if  @post.update(post_params)
      flash[:notice] = "You have update successfully "
      redirect_to post_path
    else
      render :edit
    end
  end

  def destroy
    @posts = Post.all
    @post =Post.find(params[:id])
    @post.destroy
     redirect_to posts_path(@post.id)
  end

  #選択された親カテゴリーに紐付く子カテゴリーを抽出
  def get_genre_children
    @genre_children = Genre.find(params[:parent_id]).children
  end
  #選択された子カテゴリーに紐付く孫カテゴリーを抽出
  def get_genre_grandchildren
    @genre_grandchildren = Genre.find(params[:children_id]).children
  end

  def search
    # @posts = Post.where(airport_name: params[:airport_name])
    @posts = Post.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(5)
    @genres = Genre.find_by(ancestry: nil).children
  end

  def country
    @genre = Genre.find(params[:country_id])
    @genres = Genre.find_by(ancestry: nil).children
    @posts = @genre.posts.order(:airport_name).page(params[:page]).per(5)
  end

  private

  def post_params
    params.require(:post).permit(:airport_name, :open_hour, :sleep_space, :security, :url, :others, :genre_id, :image).merge(user_id: current_user.id)
  end

  def correct_user
    @post = Post.find(params[:id])
	 # if @post.user_id != current_user(params[:user_id])
		# flash[:notice] = "You do not have authority"
		# redirect_back(fallback_location: root_path)
	 # end
  end

end
