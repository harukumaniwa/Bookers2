class BooksController < ApplicationController
  def index
    @new = Book.new
    @lists = Book.all
    @user = current_user
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.postid = current_user.id
    if @book.save
      # flash[:succsess] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @new = Book.new
      @user = current_user
      @lists = Book.all
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
    @new = Book.new
    @user = User.find(@book.postid)
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end


  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
