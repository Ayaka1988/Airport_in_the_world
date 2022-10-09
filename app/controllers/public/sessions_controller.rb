# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    new_customer_session_path
  end

  # protected
  # 退会しているかを判断するメソッド
  def user_state
    #入力されたemailからアカウント１件取得
    @user = User.find_by(email: params[:user][:email])

    #アカウントを取得できなかった場合、このメソッド終了
    return if !@user

    #取得したアカウントのパスワードと入力されたパスワードが一致しているか？
    if @user.valid_password?(params[:user][:password]) && (@user.is_valid == '退会')
      flash[:notice] = "退会済みです。"
      redirect_to genre_path
    end
  end

end
