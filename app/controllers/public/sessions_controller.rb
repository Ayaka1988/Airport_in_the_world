# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    user_mypage_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end


  # protected
  # 退会しているかを判断するメソッド
  def user_state
    @user = User.find_by(email: params[:user][:email])
    #取得したアカウントのパスワードと入力されたパスワードが一致しているか？
    if @user.valid_password?(params[:user][:password]) && (@user.is_valid == '退会')
      flash[:notice] = "退会済みです。"
      redirect_to root_path
    end
  end


end
