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
    @users = @user.followings
  end

  def followers
    @users = @user.followers
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

  #ιδΌε¦η
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
      redirect_to user_path(current_user) , notice: 'γ²γΉγγ¦γΌγΆγΌγ―γγ­γγ£γΌγ«η·¨ιη»ι’γΈι·η§»γ§γγΎγγγ'
    end
  end

  def get_profile_image
    if profile_image.attached?
      profile_image
    else
      'noimage.png'
    end
  end



  def user_params
    params.require(:user).permit(:email, :name, :profile_image)
  end
end


