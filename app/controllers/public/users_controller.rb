class Public::UsersController < ApplicationController

  before_action :autheniticate_user, {only: [:edit, :update]}
  before_action :ensure_guest_user, only: [:edit]

  def index
    @users = User.all

  end

  def show
    @user = User.find(params[:id])
    @user = current_user
    @post = @user.posts

  end


  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render "edit"
    else
      redirect_to user_mypage_path(current_user)
    end
  end


  def update
    @user = current_user
    @user.update(user_params)
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_mypage_path(current_user)
    else
    render "edit"
    end
  end

  def bookmarks
    @user = User.find(params[:id])
    bookmarks = Bookmark.where(user_id: @user.id).pluck(:post_id)
    @bookmark_posts = Post.where(id: bookmarks).page(params[:page]).per(5)
    @posts = Post.includes(:user).where(user_id: current_user.id).page(params[:page]).per(5)
  end


  def unsubscribe
    @user = User.find(params[:id])
  end

  #退会処理
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を行いました"
    redirect_to root_path
  end

  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end


  def user_params
    params.require(:user).permit(:email, :name)
  end
end


