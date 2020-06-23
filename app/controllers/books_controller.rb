class BooksController < ApplicationController
	before_action :authenticate_user!

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @post = Book.new
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id

     if @book.save
      #サクセスメッセージ　@book, notice : ""の形はエラーが起きる
      flash[:notice] = 'Book was successfully created.'
      redirect_to @book
    else
      @books = Book.all
      render 'index'

    end
  end


  def edit
    @book = Book.find(params[:id])
    if current_user.id != @book.user_id
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
#サクセスメッセージを追加
    flash[:notice] = 'Book was successfully created.'
    redirect_to book_path(@book)
#失敗したらその場でエラーメッセージ
    else
    render 'edit'
    end
 end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  private
    def book_params
      params.require(:book).permit(:title, :body)
    end

end



