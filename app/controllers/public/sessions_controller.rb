# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  # 退会しているかを判断するメソッド
  def user_state
    #入力されたemailからアカウント１件取得
    @user = User.find_by(email: params[:user][:email])

    #アカウントを取得できなかった場合、このメソッド終了
    return if !@user

    #取得したアカウントのパスワードと入力されたパスワードが一致しているか？
    if @user.valid_password?(params[:user][:password]) && (@user.is_valid == '退会')
      flash[:notice] = "退会済みです。"
      redirect_to
    end


  end


  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
