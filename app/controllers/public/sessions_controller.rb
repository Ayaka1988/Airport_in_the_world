# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource_or_scope)
      stored_location_for(resource_or_scope) || super
  end


  def after_sign_out_path_for(resource)
    root_path
  end


  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in)
    end


end

