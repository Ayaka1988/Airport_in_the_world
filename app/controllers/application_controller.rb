class ApplicationController < ActionController::Base

  before_action :configure_permitted_parameters, if: :devise_controller?

  #adminアクセス制限
  before_action :authenticate_admin!, if: :admin_url

  #adminアクセス制限
  def admin_url
    request.fullpath.include?("/admin")
  end

  def autheniticate_user
    if @current_user == nil
    flash[:notice]="ログインが必要です"
    redirect_to("/login")
    end
  end

  def set_current_user
    @current_user=User.find_by(id :session[:user_id])
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case resource
    when User
      user_mypage_path
    when Admin
      admin_root_path
    end

  end

  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
     posts_path
  end

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up,keys:[:email])
    end
end
