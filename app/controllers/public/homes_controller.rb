class Public::HomesController < ApplicationController

  def top
  end

  def about
  end

  def world
    @parents = Genre.where(ancestry: nil)
    @parents = Genre.all.order("id ASC").limit(7) #1層目7項目=> limit(7)
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
