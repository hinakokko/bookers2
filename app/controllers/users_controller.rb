class UsersController < ApplicationController
  def index
    @users = User.all
    @users = User.new
  end

  def show
    @users = Book.find(params[:id])
    @users = User.new
    @post_images = @user.post_images
    @users = User.find(user)
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
