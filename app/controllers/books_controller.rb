class BooksController < ApplicationController
  before_action :authenticate_user!, only: [:borrow, :return]

  def index
    @books = Book.includes(:borrowings)
  end

  def show
    @book = Book.find(params[:id])
    @is_borrowed = @book.borrowings.where(returned: false).exists?
  end

  def borrow
    @book = Book.find(params[:id])
    
    if @book.available?
      @book.borrowings.create(user: current_user, returned: false)
      flash[:notice] = "Book borrowed successfully."
    else
      flash[:alert] = "Book is already borrowed."
    end

    redirect_to books_path
  end


    def return
      book = Book.find(params[:id])
      borrowing = book.borrowings.where(user: current_user, returned: false).first
  
      if borrowing
        if borrowing.update(returned: true)
          flash[:notice] = "Book returned successfully."
        else
          flash[:alert] = "Failed to return book: #{borrowing.errors.full_messages.join(', ')}"
        end
      else
        flash[:alert] = "You have not borrowed this book or it has already been returned."
      end
    
      redirect_to books_path
    end
  end