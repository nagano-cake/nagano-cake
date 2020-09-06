class Public::SessionsController < ApplicationController
  before_action :configure_sign_in_params, only: [:create]

   def new
   end

   def create
   end

   def destroy
   end

   protected

   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
   end
end
