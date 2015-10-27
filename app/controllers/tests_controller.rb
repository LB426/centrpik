# coding: utf-8
class TestsController < ApplicationController
  def index
    @tests = Test.all
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.tests.new(test_params)
    if @test.save
      flash[:info] = "Тест создан."
      redirect_to test_questions_new_path(@test)
    else
      render 'new'
    end
  end

  def edit
    @test = Test.find(params[:id])
  end

private

  def test_params
    params.require(:test).permit(:name)
  end
  
end
