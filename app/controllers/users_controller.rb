class UsersController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

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
    @user = User.find(params[:id])
  end

  def create
    @book = User.new(book_params)
    @book.user_id = current_user.id
    User.save
    redirect_to users_path(@user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

end
