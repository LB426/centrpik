# coding: utf-8
class EdumaterialsController < ApplicationController
  before_action :admin_user
  
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
    mtype = params[:type]
    if mtype == "Video"
      @video = Video.create(video_params)
      if @video.save
        flash[:success] = "Ссылка на видео добавлена!"
        redirect_to videos_path
      else
        flash[:success] = "ОШИБКА: ссылка на видео НЕ добавлена!"
        redirect_to new_video_path
      end
    elsif mtype == "Book"
      @book = Book.create(book_params)
      if @book.save
        @book.name = @book.file_file_name
        @book.save
        flash[:success] = "Книга добавлена!"
        redirect_to books_path
      else
        flash[:success] = "ОШИБКА: книга НЕ добавлена!"
        redirect_to new_book_path
      end
    else
      flash[:info] = "Ошибка. Нет такого типа материала: mtype='#{@mtype}'."
      redirect_to edumaterials_path
    end
  end

  def destroy
    mtype = params[:type]
    if mtype == "Video"
      # делаем для видео
      @video = Video.find(params[:id])
      link = Coursetovideo.where("video_id = ?", @video.id)
      link.destroy if link.size == 1
      @video.destroy
      flash[:success] = "Видео удалено."
      redirect_to videos_path
    elsif mtype == "Book"
      @book = Book.find(params[:id])
      link = Coursetobook.where("book_id = ?", @book.id)
      link.destroy if link.size == 1
      @book.destroy
      flash[:success] = "Книга удалена."
      redirect_to books_path
    else
      flash[:info] = "Ошибка. Нет такого типа материала: mtype='#{@mtype}'."
      redirect_to edumaterials_path
    end
  end

  def show
    mtype = params[:type]
    if mtype == "Video"
      @video = Video.find(params[:id])
    elsif mtype == "Book"
      @book = Book.find(params[:id])
    else
      flash[:info] = "Ошибка. Нет такого типа материала: mtype='#{@mtype}'."
      redirect_to root_path
    end
  end
  
private

  def book_params
    params.require(:book).permit(:name, :description, :file)
  end

  def video_params
    params.require(:video).permit(:name, :description, :youtubelink)
  end
  
end
