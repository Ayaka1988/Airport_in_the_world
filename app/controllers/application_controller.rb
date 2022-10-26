class ApplicationController < ActionController::Base

  before_action :store_user_location!, if: :storable_location?

  #adminアクセス制限
  before_action :authenticate_admin!, if: :admin_url

  #adminアクセス制限
  def admin_url
    request.fullpath.include?("/admin")
  end

  def autheniticate_user
    if @current_user == nil
    flash.now[:notice]="ログインが必要です"
    end
  end

  def set_current_user
    @current_user=User.find_by(id :session[:user_id])
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
  end

  def after_sign_uo_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
  end


  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
     root_path
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_root_path
    end
  end

  private

    def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
    end

    def store_user_location!
      store_location_for(:user, request.fullpath)
    end

end
