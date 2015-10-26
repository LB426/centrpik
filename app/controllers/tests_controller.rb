class TestsController < ApplicationController
  def index
  end

  def new
    @test = Test.new
  end

  def create
    redirect_to test_questions_new_path(2)
  end
end
