require "test_helper"

class BookTest < ActiveSupport::TestCase
  test "should not save without title, author, or ISBN" do
    book = Book.new
    assert_not book.save, "Saved without required fields"
  end

  test "should enforce unique ISBN" do
    book1 = Book.create!(title: "Book1", author: "Author1", isbn: "123")
    book2 = Book.new(title: "Book2", author: "Author2", isbn: "123")
    assert_not book2.valid?, "ISBN should be unique"
  end
end
