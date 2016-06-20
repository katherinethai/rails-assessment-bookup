class BooksController < ApplicationController
  def index
    @book = Book.get_random
  end

  def show
    @book = Book.find(params[:book_id])
  end

  def new
    if current_user && current_user.admin
      @book = Book.new
    else
      redirect_to '/books'
    end
  end

  def create
    @book = Book.create(book_params)
    redirect_to "/books/#{@book.id}/admin"
  end

  def edit
    if current_user && current_user.admin
      set_book
    else
      redirect_to '/books'
    end
  end

  def update
    set_book
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def admin
    set_book
  end

  private
  def book_params
    params.require(:book).permit(:title, :author, :text, :img_link, :amazon_link, :genre)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end