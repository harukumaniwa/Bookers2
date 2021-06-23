class BooksController < ApplicationController
  def index
    @new = Book.new
    @lists = Book.all
    @user = current_user
    @book = Book.new
    # binding.pry
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    # binding.pry
    if @book.save
      flash[:succsess] = "You have created book successfully."
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
    @user = User.find(@book.user_id)
    @book_comment = BookComment.new
    # @post_user = BookComment.find(params[:user_id])
    # binding.pry
    
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user_id == current_user.id
    else
      redirect_to books_path
    end
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:post_update] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render "edit"
    end
  end

  private

    def book_params
      params.require(:book).permit(:title, :body)
    end
end
