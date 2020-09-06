class Public::RegistrationsController < ApplicationController
   before_action :configure_sign_up_params, only: [:create]
   before_action :configure_account_update_params, only: [:update]

   def new
   end

   def create
   end

   def edit
   end

   def update
   end

   def destroy
   end

   def cancel
   end

  protected

   def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
   end

   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end

   def after_sign_up_path_for(resource)
   end

   def after_inactive_sign_up_path_for(resource)
   end


  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    customer_path(resource)
  end
end
