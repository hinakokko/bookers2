class BooksController < ApplicationController

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
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  private

  def book_params
    params.require(:book).permit(:title, :profile_image, :body)
  end

end
