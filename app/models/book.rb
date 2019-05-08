class Book < ApplicationRecord
  has_many :reviews

  def average_book_rating
    reviews.average(:rating)
  end

  def count_book_reviews
    reviews.count
  end
end
