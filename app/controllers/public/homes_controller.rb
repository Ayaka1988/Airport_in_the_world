class Public::HomesController < ApplicationController

  def top
  end

  def about
  end


  def unsubscribe #退会画面
    @user = current_user
  end

  def withdraw #退会処理
  @user = User.find(params[:id])
  @user.update(is_valid: false) #falseにすることで退会済に変更
  reset_session
  redirect_to
  end

end
