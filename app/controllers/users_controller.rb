class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @new = Book.new
    @lists = User.all
    @user = current_user

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(postid: params[:id])
    @new = Book.new
  end

  # def create

  # end

  private

    # def book_params
    #   params.require(:book).permit(:title, :body)
    # end

    def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
    end
end
