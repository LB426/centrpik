# coding: utf-8
class AccountActivationsController < ApplicationController

  def edit
    user = User.find_by(email: params[:email])
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      flash[:success] = "Учётная запись активирована!"
      redirect_to user
    else
      flash[:danger] = "Активация не удалась. Возможно линк активации устарел."
      redirect_to root_url
    end
  end

end
