class UsersController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
    @users = User.all
  end

  def edit

  end

  def create
    @book = User.new(book_params)
    @book.user_id = current_user.id
    User.save
    flash[:notice] = "You have updated user successfully."
    redirect_to users_path(@user.id)
  end

  private

  def users_params
    params_require(:users).permit(:title, :body)
  end

end
