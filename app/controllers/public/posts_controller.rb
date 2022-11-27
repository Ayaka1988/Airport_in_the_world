class Public::PostsController < ApplicationController

  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create]

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(10)
    @genres = Genre.find_by(ancestry: nil).children
  end

  def show
    @post =Post.find(params[:id])
    @comment = Comment.new
    @user = @post.user
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:notice] = "Thank you for your posting!"
      redirect_to posts_path
    else
      @genres = Genre.find_by(ancestry: nil).children
      render :new
    end
  end

  def new
    if user_signed_in?
      @post = Post.new
      @genres = Genre.find_by(ancestry: nil).children
    else
      flash[:notice]= "Please login"
      redirect_to new_user_session_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @genres = Genre.find_by(ancestry: nil).children
    unless @post.user == current_user
    redirect_to  edit_post_path
    end
  end

  def update
    @post = Post.find(params[:id])
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
    if @post.is_my_post(params[:id], current_user.id)
      @post.destroy
     flash[:notice] = "You have deleted successfully"
     redirect_to posts_path(@post.id)
    else
      redirect_to posts_path(@post.id)
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

  def search
    # @posts = Post.where(airport_name: params[:airport_name])
    @posts = Post.search(params[:keyword]).order(created_at: :desc).page(params[:page]).per(10)
    @genres = Genre.find_by(ancestry: nil).children
  end

  def country
    @genre = Genre.find(params[:country_id])
    @genres = Genre.find_by(ancestry: nil).children
    @posts = @genre.posts.order(:airport_name).page(params[:page]).per(5)
  end

  private

  def post_params
    params.require(:post).permit(:airport_name, :open_hour, :sleep_space, :access, :security, :url, :wifi, :others, :genre_id, :latitude, :longitude, :image).merge(user_id: current_user.id)
  end


end
