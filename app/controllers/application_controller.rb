# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  private

  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Вы не вошли на сайт. Пожалуйста выполните вход."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    unless current_user?(@user) || current_user.admin
      flash[:danger] = "Некорректный пользователь"
      redirect_to(root_url) 
    end
  end

  # Confirms an admin user.
  def admin_user
    unless ( logged_in? && current_user.admin? )
      store_location
      flash[:danger] = "У Вас недостаточно прав для выполнения этой операции."
      redirect_to root_url
    end  
    # redirect_to(root_url) unless current_user.admin?
  end
  
end
