# coding: utf-8
class LinksController < ApplicationController
  before_action :admin_user
  
  def create_course_to_test_link
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    link = Coursetotest.new
    link.course_id = @course.id
    link.test_id = @test.id
    link.save
    redirect_to edit_course_path(@course)
  end

  def destroy_course_to_test_link
    @course = Course.find(params[:course_id])
    @test = Test.find(params[:test_id])
    @link = Coursetotest.where("course_id = ? AND test_id = ?", @course, @test)
    @link.destroy_all
    flash[:success] = "курс-тест линк удалён"
    redirect_to edit_course_path(@course)
  end

  def create_course_to_video_link
    @course = Course.find(params[:course_id])
    @video = Video.find(params[:video_id])
    link = Coursetovideo.new
    link.course_id = @course.id
    link.video_id = @video.id
    link.save
    redirect_to edit_course_path(@course)
  end

  def destroy_course_to_video_link
    @course = Course.find(params[:course_id])
    @video = Video.find(params[:video_id])
    @link = Coursetovideo.where("course_id = ? AND video_id = ?", @course, @video)
    @link.destroy_all
    flash[:success] = "курс-видео линк удалён"
    redirect_to edit_course_path(@course)
  end

  def create_course_to_book_link
    @course = Course.find(params[:course_id])
    @book = Book.find(params[:book_id])
    link = Coursetobook.new
    link.course_id = @course.id
    link.book_id = @book.id
    link.save
    redirect_to edit_course_path(@course)
  end

  def destroy_course_to_book_link
    @course = Course.find(params[:course_id])
    @book = Book.find(params[:book_id])
    @link = Coursetobook.where("course_id = ? AND book_id = ?", @course, @book)
    @link.destroy_all
    flash[:success] = "курс-книга линк удалён"
    redirect_to edit_course_path(@course)
  end
  
end
