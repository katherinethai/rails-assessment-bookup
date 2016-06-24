class ReportsController < ApplicationController
  def index
    @most_favorited_book = Book.most_favorited
    @book_id = @most_favorited_book.id
    @num_users = User.all.count
    @num_books = Book.all.count
  end
end