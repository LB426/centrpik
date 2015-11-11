# coding: utf-8
class StatisticsController < ApplicationController
  before_action :admin_user

  def index

  end

  def course
  end

  # все курсы одного юзера
  def courses
    @user = User.find(params[:id])
    @attempts = TestingStatAttempt.where(user_id: @user)
    logger.debug "@attempts: #{@attempts.class}"
  end

private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

end
