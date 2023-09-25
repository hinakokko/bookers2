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
    @user = User.find(params[:id])
  end

  def create
    @book = User.new(book_params)
    @book.user_id = current_user.id
    if User.save
      redirect_to users_path(@user.id)
    else
      redirect_to book_path(@user.id)
      flash.now[:notice] = "・Title can't be blank・Body can't be blank"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(users_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  private

  def users_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
