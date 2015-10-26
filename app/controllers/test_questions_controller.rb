class TestQuestionsController < ApplicationController
  def new
    @test = Test.find(params[:id])
  end

  def create

  end
end
