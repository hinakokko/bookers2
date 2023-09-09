class BooksController < ApplicationController

  def index
    @books = Books.all
  end

  def show
  end

end
