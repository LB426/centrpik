# coding: utf-8
class UserMailer < ApplicationMailer

  def account_activation(user)
    @user = user
    mail to: user.email, subject: "активация пользователя"
  end

  def password_reset(user)
    @user = user
    mail to: user.email, subject: "сброс пароля"
  end
end
