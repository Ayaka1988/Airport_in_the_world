class Public::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_mypage_path
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


