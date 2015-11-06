# coding: utf-8
class TestingController < ApplicationController
  def new
    @test = Test.find(params[:test_id])
    @question = @test.test_questions.find(params[:question_id])
    @answers = @question.answers.all.order(:id => "ASC")
    TestingIntermediateResult.where( "user_id=:user_id AND test_id=:test_id",
                                     {
                                       user_id: current_user.id,
                                       test_id: @test.id
                                     }
                                   ).destroy_all
  end

  def continue
    @test = Test.find(params[:test_id])
    @question = @test.test_questions.find(params[:question_id])
    @answers = @question.answers.all.order(:id => "ASC")
    render :new
  end
  
  def create
    @test = Test.find(params[:test_id])
    @question = @test.test_questions.find(params[:question_id])
    # найти последний вопрос теста
    @last_question = @test.test_questions.all.last
    if @last_question.id != @question.id
      # если это не последний вопрос теста
      answers = params[:answers]
      unless answers.nil?
        answers.each do |key,val|
          result = TestingIntermediateResult.new
          result.user_id = current_user.id
          result.test_id = @test.id
          result.test_question_id = @question.id
          result.answer_id = key.to_i
          logger.debug "key: #{key.class} #{key}"
          answer = Answer.find(key)
          if answer.proper
            result.proper = true
          else
            result.proper = false
          end
          result.save
        end
      end
      # какие вопросы имеют ответы для теста @test
      what_questions_have_answers = TestingIntermediateResult.where(
        "user_id=:user_id AND test_id=:test_id",
        { user_id: current_user.id, test_id: @test.id } ).order(:id=>"ASC" )
      logger.debug "what_questions_have_answers: #{what_questions_have_answers.size}"
      # формируем массив ID тестовых вопросов на которые есть ответ для теста @test
      arr_ids = Array.new
      what_questions_have_answers.each do |answers|
        arr_ids << answers.test_question_id
      end
      logger.debug "arr_ids befor sort: #{arr_ids}"
      arr_ids.uniq!
      arr_ids.sort!
      logger.debug "arr_ids after sort: #{arr_ids}"
      next_question = @test.test_questions.where.not(id: arr_ids).order(:id=>"ASC")
      logger.debug "next_question arr size: #{next_question.size}"
      logger.debug "next_question id: #{next_question[0].id}"
      redirect_to testing_continue_path(@test, next_question[0].id)
    else
      # если это последний вопрос теста
      answers = params[:answers]
      unless answers.nil?
        answers.each do |key,val|
          result = TestingIntermediateResult.new
          result.user_id = current_user.id
          result.test_id = @test.id
          result.test_question_id = @question.id
          result.answer_id = key.to_i
          answer = Answer.find(key)
          if answer.proper
            result.proper = true
          else
            result.proper = false
          end
          result.save
        end
        # делаем пустую запись в статистику
        stat = TestingStatAttempt.create( :user_id  => current_user.id,
                                          :test_id  => @test.id,
                                          :attempt  => nil,
                                          :tmbegin  => nil,
                                          :tmend    => nil,
                                          :duration => nil )
        
        # вычисляем количество предидущих попыток
        previos_attempts = 0
        res = TestingResult.where( user_id: current_user.id, test_id: @test.id ).last
        unless res.nil?
          previos_attempts = res.attempt
        end
        logger.debug "previos_attempts: #{previos_attempts}"
        res_intermediate = TestingIntermediateResult.where(
                                     "user_id=:user_id AND test_id=:test_id",
                                     { user_id: current_user.id,
                                       test_id: @test.id } ).order(:id=>"ASC" )
        counter = -1
        res_intermediate.each do |ir|
          TestingResult.create(
                            user_id: ir.user_id,
                            test_id: ir.test_id,
                   test_question_id: ir.test_question_id,
                          answer_id: ir.answer_id,
                             proper: ir.proper,
                            attempt: previos_attempts + 1,
            testing_stat_attempt_id: stat.id
          )
          counter += 1
        end
        # вычисляем время
        tmbegin = res_intermediate[0].created_at
        tmend = res_intermediate[counter].created_at
        dur = tmend - tmbegin
        logger.debug "dur: #{tmbegin} #{tmend} #{dur}"

        res_intermediate.destroy_all
        stat.tmbegin = tmbegin
        stat.tmend = tmend
        stat.attempt = previos_attempts + 1
        stat.duration = dur
        stat.numquestion = @test.test_questions.count
        stat.save

        testres = TestingResult.where( "user_id=:user_id AND
                                       test_id=:test_id AND
                                       attempt=:attempt AND
                                       proper=:proper",
                                       { user_id: current_user.id,
                                         test_id: @test.id,
                                         attempt: stat.attempt,
                                          proper: true }
                                     ).count
        logger.debug "testres: #{testres}"
        stat.numcorrectanswers = testres
        stat.save
                
        redirect_to testing_result_show_path(@test,stat.attempt)
      else
        flash[:info] = "Выберите вариант ответа."
        redirect_to testing_continue_path(@test, @question)
      end
    end
  end

  def show
    @test = Test.find(params[:id])
    @stat = TestingStatAttempt.where(attempt: params[:attempt])
    @numquest = @stat[0].numquestion
    @numcorrectansw = @stat[0].numcorrectanswers
    @assessment = @numcorrectansw - @numquest
  end

  def details
    @test = Test.find(params[:id])
    @attempt = @test.testing_stat_attempts.last.attempt
    logger.debug "attempt: #{@attempt}"
    @questions = @test.test_questions.all.order(id: "ASC")
    @questions.each do |q|
      
    end
  end

end
