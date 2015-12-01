# coding: utf-8
class SessionsController < ApplicationController
  before_action :logged_in_user, only: [:changeuser]
  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_to root_url
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  def changeuser
    olduser = User.find(current_user.id)
    newuser = User.find(params[:user_id])
    log_out if logged_in?
    if olduser.admin
      log_in newuser
    elsif olduser.cadmin
      company = Company.find(olduser.company_id)
      if newuser.company_id == company.id
        log_in newuser
        flash.now[:danger] = "Вы вошли как сотрудник компании #{company.name}"
      else
        flash.now[:danger] = 'Вы не являетесь сотрудником этой компании'
      end
    else
      flash.now[:danger] = 'Недостаточно прав для выполнения этой операции'
    end
    redirect_to root_url
  end
  
end
