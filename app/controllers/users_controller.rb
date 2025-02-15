class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @borrowed_books = current_user.borrowings.where(returned: false)
  end
end
