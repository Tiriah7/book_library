class Borrowing < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :due_date, presence: true
  validate :book_available, on: :create

  before_validation :set_due_date, on: :create

  def set_due_date
    self.due_date ||= 2.weeks.from_now
  end

  def book_available
    errors.add(:book, "is already borrowed") unless book.available?
  end
end
