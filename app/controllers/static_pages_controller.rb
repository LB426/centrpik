class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      #@feed_items = current_user.feed.paginate(page: params[:page])
      @feed_items = Micropost.all.paginate(page: params[:page])
    else
      @newscounter = 35      
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def library
    @books = Book.all
  end

  def dlearning
  end
end
