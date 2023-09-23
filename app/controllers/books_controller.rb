class BooksController < ApplicationController

  def index
    @users = User.all
    @users = User.new
    @user = current_user
    @book = Book.all
  end

  def new
    @books = Books.new
    @book = Books.all
  end

  def edit

  end

  def show

  end

  def create
    @user = Book.new(books_path)
    @books.user_id = current_user.id
    @books.save
  end

end
