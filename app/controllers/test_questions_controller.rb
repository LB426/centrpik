# coding: utf-8
class TestQuestionsController < ApplicationController
  def new
    @test = Test.find(params[:id])
  end

  def create
    @test = Test.find(params[:id])
    testquestion = @test.test_questions.new(question: params[:question])
    unless params[:picture].nil?
      testquestion.picture = params[:picture]
      testquestion.save
    end
    
    answers = params[:answers]
    answers.each do |answer|
      # возможно наду переделать т.к. answer - это хэш
      answer_text = answer[1]["text"]
      answer_right = false
      answer_right = true if answer[1]["right"] == "YES"
      logger.debug "answer: #{answer.class} #{answer_text} #{answer_right}"
      answer = testquestion.answers.new( ans_text: answer_text,
                                           proper: answer_right )
      answer.save
    end
    redirect_to test_edit_path(@test)
  end

  def update
    @test = Test.find(params[:test_id])
    @question = TestQuestion.find(params[:question_id])
    @question[:question] = params[:question]
    unless params[:clearpic].nil?
      @question.picture = nil
    else
      @question.picture = params[:picture] unless params[:picture].nil?
    end
    @question.save
    answers = params[:answers]
    unless answers.nil?
      answers.each do |key,val|
        id = key.to_i
        text = val["text"]
        right = false
        right = true if val["right"] == "YES"
        if id >= 0
          answer = Answer.find(id)
          answer[:ans_text] = text
          answer[:proper] = right
          answer.save
        else
          answer = @question.answers.new( ans_text: text,
                                            proper: right )
          answer.save
        end
      end 
    end
    redirect_to test_edit_path(@test)
  end

  def destroy
    @test = Test.find(params[:test_id])
    @question = @test.test_questions.find(params[:question_id])
    @question.destroy
    flash[:success] = "Вопрос удалён"
    redirect_to test_edit_path(@test)
  end
  
  def answer_destroy
    @test = Test.find(params[:test_id])
    @answer = Answer.find(params[:answer_id])
    @answer.destroy
    flash[:success] = "Вопрос удалён"
    redirect_to test_edit_path(@test)
  end
  
end
