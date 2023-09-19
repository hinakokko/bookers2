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
  end

  def edit

  end

  def create
    @users = User.new(edit_user_path)
    User.save
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(resource)
  end

  private

  def users_params
    params_require(:users).permit(:title, :body)
  end

end
