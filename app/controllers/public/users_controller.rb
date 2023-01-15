class Public::UsersController < ApplicationController

  before_action :autheniticate_user, only: [:edit, :update]
  before_action :ensure_guest_user, only: [:edit]
  before_action :set_user, only: [:followings, :followers]

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
      flash[:notice] = "You have updated successfully."
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
    @genres = Genre.find_by(ancestry: nil).children
  end

  def followings
    user = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def follow
    @user = User.find(params[:id])
    @users = @user.followings or @user.followers

    # followings = Following.where(user_id: @user.id)
    # @following_users = User.where(id: users)


  end

  def posted
    @user = User.find(params[:id])
    @posted = Post.includes(:user).where(user_id:params[:id]).page(params[:page]).per(5)
    @genres = Genre.find_by(ancestry: nil).children
    @posts = Post.includes(:user).where(user_id: current_user.id).page(params[:page]).per(5)
  end

  def mychat
    @user = User.find(params[:id])
    rooms = current_user.user_rooms.pluck(:room_id)
    @user_rooms = UserRoom.where(room_id: rooms).where.not(user_id: current_user.id)
  end

  def unsubscribe
    @user = User.find(params[:id])
  end

  #退会処理
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "Thankyou for your support"
    redirect_to root_path
  end

  private

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.name == "guestuser"
      redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
    end
  end

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'noimage.png'
    end
  end

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name, :profile_image)
  end
end


