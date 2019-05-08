class Book < ApplicationRecord
  has_many :reviews

  def average_book_rating
    reviews.average(:rating)
  end
end
