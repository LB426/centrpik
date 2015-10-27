class TestQuestionsController < ApplicationController
  def new
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.find(params[:id])
    redirect_to test_edit_path(@test)
  end

end
