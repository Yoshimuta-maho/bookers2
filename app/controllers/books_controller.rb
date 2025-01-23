class BooksController < ApplicationController

  def Top
    
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book.params)
    book.save
    redirect_to @book
  end

  def update
    @book = Book.find(params[:id])
    book.update(book_params)
    redirect_to @book
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
