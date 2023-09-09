class BooksController < ApplicationController

  def index
    @books = Books.all
  end

  def new
    @books = Books.new
  end

  def show
  end

  def create
    @books = Books.new(books_params)
    @books.user_id = current_user.id
    @books.save
  end



end
