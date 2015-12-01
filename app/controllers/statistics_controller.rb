# coding: utf-8
class StatisticsController < ApplicationController
  before_action :logged_in_user

  def index
  end

  # один курс одного юзера
  def course
    @user = User.find(params[:user_id])
    @attempt = TestingStatAttempt.find(params[:attempt_id])
    @test = Test.find(@attempt.test_id)
  end

  # все курсы одного юзера
  def courses
    @user = User.find(params[:id])
    @attempts = TestingStatAttempt.where(user_id: @user)
  end

end
