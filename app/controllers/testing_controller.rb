class TestingController < ApplicationController
  def new
    @test = Test.find(params[:test_id])
    @question = params[:question_id]
  end

  def create
    @test = Test.find(params[:test_id])
    @question = params[:question_id]
    redirect_to testing_new_path(@test, @question)
  end

  def show
    @test = Test.find(params[:id])
  end

  def details
    @test = Test.find(params[:id])
  end

end
