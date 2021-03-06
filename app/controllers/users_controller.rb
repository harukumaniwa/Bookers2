class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @new = Book.new
    @lists = User.all
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user.id == current_user.id
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    # binding.pry
      flash[:update] = "You have updated user successfully."
      redirect_to user_path
    else
      render "edit"
    end
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: params[:id])
    @new = Book.new
  end

  # def create

  # end

  private

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
