class BorrowingsController < ApplicationController
  def index
    @borrowings = Borrowing.all
  end
end
