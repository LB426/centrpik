# coding: utf-8
class EdumaterialsController < ApplicationController
  def index
    @mtype = params[:type]
    logger.debug "TYPE: #{@mtype}"
    @edumaterials = Edumaterial.where(type: params[:type])
  end

  def new
    @mtype = params[:type]
    if @mtype == "Video"
      @video = Video.new
      render 'new_video'
    elsif @mtype == "Book"
      @book = Book.new
      render 'new_book'
    else
      flash[:info] = "Ошибка. Нет такого типа материала: mtype='#{@mtype}'."
      redirect_to edumaterials_path
    end
  end

  def create
    @edumat = Book.create(micropost_params)
    if @edumat.save
      flash[:success] = "Материал добавлен!"
      redirect_to books_path
    else
      flash[:success] = "ОШИБКА: Материал НЕ добавлен!"
      redirect_to new_book_path
    end
  end

private

  def micropost_params
    params.require(:book).permit(:name, :description, :file)
  end
  
end
