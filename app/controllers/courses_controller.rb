# coding: utf-8
class CoursesController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user, only: [:new, :edit, :create, :update, :destroy]
  
  def index
    @courses = Course.all.order( :id => "ASC" )
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      flash[:info] = "Курс создан"
      redirect_to edit_course_path(@course)
    else
      flash[:danger] = "ERROR: создать курс не удалось!"
      render 'new'
    end
  end

  def show
    @user = current_user
    @course = Course.find(params[:id])

    links = Coursetovideo.where("course_id = ?", @course)
    video_id_arr = Array.new
    links.each do |link|
      video_id_arr << link.video_id
    end
    @videos = Video.find(video_id_arr)
    
    links = Coursetobook.where("course_id = ?", @course)
    book_id_arr = Array.new
    links.each do |link|
      book_id_arr << link.book_id
    end
    @books = Book.find(book_id_arr)

    links = Coursetotest.where("course_id = ?", @course)
    test_id_arr = Array.new
    links.each do |link|
      test_id_arr << link.test_id
    end
    @tests = Test.find(test_id_arr)
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])
    if @course.update_attributes(course_params)
      flash[:success] = "Курс обновлён"
      redirect_to edit_course_path(@course)
    else
      render 'edit'
    end
  end

  def destroy
    Course.find(params[:id]).destroy
    flash[:success] = "курс удалён"
    redirect_to courses_path
  end


private

  def course_params
    params.require(:course).permit(:name, :description)
  end
  
end
