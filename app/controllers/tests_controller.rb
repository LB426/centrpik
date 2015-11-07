# coding: utf-8
class TestsController < ApplicationController
  before_action :admin_user, :only => [ :new, :create,
                                        :edit, :update,
                                        :destroy ]
  
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
    @questions = @test.test_questions.all.order(:id => "asc")
  end

  def update
    @test = Test.find(params[:id])
    if @test.update_attributes(:name => params[:name])
      flash[:success] = "Название теста изменено"
    else
      flash[:danger] = "ERROR! Название теста изменить не удалось"
    end
    redirect_to test_edit_path(@test)
  end
  
  def destroy
    @test = Test.find(params[:id])
    @test.destroy
    flash[:success] = "Тест удалён"
    redirect_to tests_path
  end

private

  def test_params
    params.require(:test).permit(:name)
  end

  # Confirms an admin user.
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
  
end
