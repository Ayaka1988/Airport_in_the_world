class Public::UsersController < ApplicationController

  def index
    @users = User.all
    # @user = current_user
    # @post = Post.new
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
    @bookmark_posts = Post.find(bookmarks)
  end

  def unsubscribe
    @user = current_user
  end

  #退会処理
  def withdrawal
    @user = User.find(params[:id])
    @user.update(is_valid: false) #falseにすることで退会済に変更
    reset_session
    flash[:notice] = "退会処理を行いました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :name)
  end
end


