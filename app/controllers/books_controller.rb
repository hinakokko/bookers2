class BooksController < ApplicationController

  def index
    @users = User.all
    @users = User.new
  end

  def new
    @books = Books.new
  end

  def edit

  end

  def show

  end

  def create
    @books = Books.new(book_path_params)
    @books.user_id = current_user.id
    @books.save
  end

end
