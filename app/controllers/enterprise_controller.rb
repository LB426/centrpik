class EnterpriseController < ApplicationController
  before_action :logged_in_user
  
  def testing
    @company = current_user.companies.first
    @user = User.find(params[:user_id])
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @question = @test.test_questions.find(params[:question_id])
    @answers = @question.answers
    @first_question = @test.test_questions.all.order(:id => "asc")[0]
  end

  def testing_employe_select
    @company = current_user.companies.first
    @users = User.where("company_id = ?", @company.id)
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
  end
  
end
