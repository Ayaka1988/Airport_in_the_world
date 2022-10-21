class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #adminアクセス制限
  before_action :authenticate_admin!, if: :admin_url
  #adminアクセス制限

  def admin_url
    request.fullpath.include?("/admin")
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
