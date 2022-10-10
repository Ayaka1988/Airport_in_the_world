class Public::UsersController < ApplicationController

  def index
    @users = User.all
    # @user = current_user
    # @post = Post.new
  end

  def show
    @user = User.find(params[:id])
    @user = current_user.id
    @posts = current_user.posts
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
    render :edit
    end
  end

  def unsubscribe
  end

  def withdrawal
    @user = current_user
    @user.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を行いました"
    redirect_to world_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :address, )
  end
end


