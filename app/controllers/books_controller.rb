class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def index
    @book = Book.new
    @user = current_user
    @books = Book.all
  end

  def new
    @books = Books.new
    @book = Books.all
  end

  def edit
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
    @user_image = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = current_user
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = "You have updated user successfully."
       redirect_to book_path(@book.id)
    else
      render:edit
    end  
  end

  private

  def book_params
    params.require(:book).permit(:title, :profile_image, :body)
  end

  def is_matching_login_user
    book = Book.find(params[:id])
    user = User.find(book.user.id)
    unless user.id == current_user.id
      redirect_to books_path
    end
  end

end
